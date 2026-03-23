# Host Contracts (Proposed)

## Purpose
Define a small, versioned extension contract that modules implement and the host calls.

## Core Interfaces (Conceptual)

```csharp
public interface IEditorModule
{
    ModuleDescriptor Describe();
    void ConfigureServices(IServiceCollection services, ModuleHostContext context);
    void ConfigureMvc(IMvcBuilder mvc, ModuleHostContext context);
    Task InitializeAsync(IServiceProvider services, ModuleHostContext context, CancellationToken cancellationToken);
}

public interface IModuleMenuContributor
{
    IEnumerable<ModuleMenuItem> GetMenuItems(ModuleMenuContext context);
}

public interface IModuleHealthCheck
{
    Task<ModuleHealthStatus> CheckAsync(CancellationToken cancellationToken);
}
```

## Descriptor Models

```csharp
public sealed class ModuleDescriptor
{
    public string Id { get; init; } = string.Empty;
    public string Name { get; init; } = string.Empty;
    public string Version { get; init; } = string.Empty;
    public string HostApiVersion { get; init; } = "1.0";
    public IReadOnlyList<string> Capabilities { get; init; } = Array.Empty<string>();
}

public sealed class ModuleMenuItem
{
    public string Id { get; init; } = string.Empty;
    public string Label { get; init; } = string.Empty;
    public string Location { get; init; } = "main.manage";
    public int Order { get; init; } = 1000;
    public string? IconCss { get; init; }
    public string Route { get; init; } = "/";
    public IReadOnlyList<string> RolesAny { get; init; } = Array.Empty<string>();
}
```

## Host Runtime Services

1. `IModuleRegistry`
- Query installed/enabled modules
- Resolve effective module set by tenant

2. `IModuleInstaller`
- Validate and install package
- Handle update and uninstall

3. `IModuleLoader`
- Load module assemblies
- Provide `IEditorModule` instances

4. `IModuleMenuService`
- Compose core + module menu entries for current user/tenant

5. `IModuleAuditService`
- Record lifecycle and runtime events

## Module Containment and Trusted IMediator Boundary

### Design Decision

Host IMediator registration remains a trusted host-only pipeline.

Module assemblies are not included in global host IMediator scanning.

### Why This Boundary Matters

1. Limits blast radius from module bugs.
2. Prevents module handlers from intercepting or conflicting with host request types.
3. Reduces accidental privilege escalation through implicit access to internal host command/query flows.
4. Keeps host command contracts evolvable without breaking external modules.

### Registration Rules for Program Startup

1. Host-only mediator registration
- Keep current host mediator scanning for first-party assemblies only.
- Explicitly exclude module extraction/load paths from host mediator scanning.

2. Module registration via explicit contracts
- Module loader discovers `IEditorModule` implementations.
- Host invokes explicit lifecycle methods (`Describe`, `ConfigureServices`, `ConfigureMvc`, `InitializeAsync`).
- No implicit handler discovery from module assemblies.

3. Optional module-local command bus
- If command-style composition is needed inside a module, provide module-local mediator/bus scoped to that module.
- Module-local handlers are never auto-registered as host-global handlers.

4. Controlled cross-boundary calls
- Modules call host capabilities through narrow, versioned facades.
- Do not expose raw host `IMediator` to modules by default.

### Security and Reliability Guardrails

1. Capability-gated service exposure
- Module receives only approved service facades based on manifest capabilities.

2. Exception and timeout boundaries
- Wrap module lifecycle hooks and extension points with error handling and timeouts.

3. Health-based containment
- Repeated runtime failures move module state from `Enabled` to `Degraded` and then `Quarantined`.

4. Auditability
- Log module install, enable/disable, failures, and quarantine transitions with actor and tenant scope.

### Program.cs Policy Checklist

1. Register host mediator using explicit host assemblies.
2. Do not call mediator assembly scanning over dynamic module directories.
3. Register module runtime services (`IModuleRegistry`, `IModuleLoader`, `IModuleMenuService`) separately.
4. Load module MVC application parts only after package validation and capability checks.
5. Keep module routing and static asset prefixes namespaced under module identifiers.

## MVC and Routing Integration

1. Module controllers
- Registered through application parts after host validation.

2. Route conventions
- Prefix module routes under `/modules/{moduleId}/...`.
- Prevent route collisions with host controllers.

3. Authorization
- Module endpoints must use host authorization primitives.
- Host can apply fallback authorization policy per module.

## Static Assets Integration

1. Per-module static path
- `/modules/{moduleId}/...`

2. Asset source
- Served from module package `wwwroot/` extraction path.

3. Policy
- No module may overwrite host static files.

## Versioning and Breaking Changes

1. Host contract major changes increment `HostApiVersion` major.
2. Module manifest declares compatible host API range.
3. Host rejects modules with incompatible API ranges.

## Tenant Awareness

1. Host passes tenant context through `ModuleHostContext`.
2. Module menu/items/routes can be gated by tenant policy.
3. Module persistent data must include tenant partition/scoping where applicable.
