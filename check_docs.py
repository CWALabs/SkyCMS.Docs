import os
import re
import yaml
from pathlib import Path
import json

root_dir = Path(r"d:\source\SkyCMS.Docs\for-developers")
results = []

for filepath in root_dir.rglob("*.md"):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    rel_path = filepath.relative_to(root_dir).as_posix()
    
    # Extract frontmatter
    fm = {}
    if content.startswith('---'):
        parts = content.split('---', 2)
        if len(parts) >= 3:
            try:
                fm = yaml.safe_load(parts[1]) or {}
            except Exception as e:
                fm = {"error": str(e)}

    h1_count = len(re.findall(r"^#\s+(.+)$", content, re.MULTILINE))
    
    summary_match = re.search(r"##\s*Summary\n+(.*?)(?=\n##)", content, re.DOTALL | re.IGNORECASE)
    summary = summary_match.group(1).strip() if summary_match else None
    
    code_blocks = len(re.findall(r"```", content))
    broken_snippets = (code_blocks % 2 != 0)

    results.append({
        "file": str(filepath.as_posix()),
        "frontmatter": fm,
        "h1_count": h1_count,
        "summary": summary[:300] + "..." if summary and len(summary) > 300 else summary,
        "broken_snippets": broken_snippets,
        "content_length": len(content)
    })

with open('d:\\source\\SkyCMS.Docs\\check_results.json', 'w', encoding='utf-8') as f:
    json.dump(results, f, indent=2)
print("Saved to check_results.json")