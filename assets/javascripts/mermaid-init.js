(function () {
  function isLikelyMermaidDefinition(text) {
    if (!text) {
      return false;
    }

    var normalized = text.trim();
    if (!normalized) {
      return false;
    }

    if (normalized.indexOf("%%{init:") === 0) {
      return true;
    }

    var mermaidStartPattern = /^(?:flowchart|graph|sequenceDiagram|classDiagram|stateDiagram(?:-v2)?|erDiagram|gantt|journey|pie(?:\s+title)?|mindmap|timeline|gitGraph|quadrantChart|requirementDiagram|block-beta|C4Context|C4Container|C4Component|C4Dynamic|C4Deployment)\b/m;
    return mermaidStartPattern.test(normalized);
  }

  function convertCodeBlockToMermaid(codeBlock) {
    if (!codeBlock || codeBlock.dataset.mermaidConverted === "true") {
      return;
    }

    var codeText = codeBlock.textContent || "";
    if (!isLikelyMermaidDefinition(codeText)) {
      return;
    }

    var replacementTarget = codeBlock.closest("div.highlight") || codeBlock.parentElement;
    if (!replacementTarget || !replacementTarget.parentElement) {
      return;
    }

    var container = document.createElement("div");
    container.className = "mermaid";
    container.textContent = codeText;

    codeBlock.dataset.mermaidConverted = "true";
    replacementTarget.parentElement.replaceChild(container, replacementTarget);
  }

  function renderMermaidDiagrams() {
    if (typeof mermaid === "undefined") {
      return;
    }

    // Convert Markdown-rendered Mermaid code fences into Mermaid containers.
    document.querySelectorAll("pre code.language-mermaid").forEach(convertCodeBlockToMermaid);

    // MkDocs highlighting may strip the language-mermaid class; detect Mermaid syntax in generic blocks.
    document.querySelectorAll("div.highlight > pre > code").forEach(convertCodeBlockToMermaid);

    mermaid.initialize({
      startOnLoad: false,
      securityLevel: "loose",
      theme: "default"
    });

    // Re-render when navigating with Material instant navigation.
    mermaid.run({ querySelector: ".mermaid:not([data-processed])" });
  }

  if (window.document$ && typeof window.document$.subscribe === "function") {
    window.document$.subscribe(renderMermaidDiagrams);
  } else {
    document.addEventListener("DOMContentLoaded", renderMermaidDiagrams);
  }
})();
