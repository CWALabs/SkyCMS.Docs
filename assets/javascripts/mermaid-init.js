(function () {
  function renderMermaidDiagrams() {
    if (typeof mermaid === "undefined") {
      return;
    }

    // Convert Markdown-rendered mermaid code fences into Mermaid containers.
    var mermaidCodeBlocks = document.querySelectorAll("pre code.language-mermaid");
    mermaidCodeBlocks.forEach(function (codeBlock) {
      var pre = codeBlock.parentElement;
      if (!pre || !pre.parentElement) {
        return;
      }

      var container = document.createElement("div");
      container.className = "mermaid";
      container.textContent = codeBlock.textContent || "";
      pre.parentElement.replaceChild(container, pre);
    });

    mermaid.initialize({
      startOnLoad: false,
      securityLevel: "loose",
      theme: "default"
    });

    // Re-render when navigating with Material instant navigation.
    mermaid.run({ querySelector: ".mermaid" });
  }

  if (window.document$ && typeof window.document$.subscribe === "function") {
    window.document$.subscribe(renderMermaidDiagrams);
  } else {
    document.addEventListener("DOMContentLoaded", renderMermaidDiagrams);
  }
})();
