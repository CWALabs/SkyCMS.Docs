import json
from pathlib import Path

data = json.load(open('d:\\source\\SkyCMS.Docs\\check.json', encoding='utf-8'))

for d in data:
    f = d['file']
    fm = d.get('frontmatter', {})
    
    # Check severity: High
    if d['h1_count'] != 1:
        print(f'[High] {f}: Expected 1 H1, found {d["h1_count"]}')
    if d['broken_snippets']:
        print(f'[High] {f}: Broken code snippets (odd number of backticks)')
    if d['content_len'] < 100:
        print(f'[High] {f}: Very low content length ({d["content_len"]} bytes), possible content loss')
        
    s = str(d.get('summary', '')).strip()
    s_len = len(s)
    if 'MISSING' in s or not s:
        pass # Handle separately
    elif s_len < 30:
        print(f'[Medium] {f}: Summary is very short -> {s}')
    elif "This document" in s or "This article" in s or "In this document" in s:
        print(f'[Medium] {f}: Generic summary -> {s[:50]}...')
    elif s.lower().count('summary') > 1:
       print(f'[Medium] {f}: Redundant summary -> {s[:50]}...')

    # Audience
    aud = str(fm.get('audience', '')).lower()
    diff = str(fm.get('difficulty', '')).lower()
    if 'beginner' in aud and 'advanced' in diff:
        print(f'[Medium] {f}: Audience ({aud}) vs Difficulty ({diff}) mismatch')
    if 'advanced' in aud and 'beginner' in diff:
        print(f'[Medium] {f}: Audience ({aud}) vs Difficulty ({diff}) mismatch')
    if 'expert' in aud and 'beginner' in diff:
        print(f'[Medium] {f}: Audience ({aud}) vs Difficulty ({diff}) mismatch')
        
    doc_type = fm.get('doc_type')
    product_area = fm.get('product_area')
    user_intent = fm.get('user_intent')
    
    # Expected doc types
    if doc_type not in ["Article", "Tutorial", "Guide", "Conceptual", "Reference", "Overviews", "Architecture Profile", "Decision Record", "Topic", "Index", "Landing Page", "Overview"]:
        print(f'[Low] {f}: Unusual doc_type ({doc_type})')
    
    if product_area not in ["Core", "Extensions", "API", "Auth", "Deployment", "Architecture", "Extensibility", "Website Launch", "Security", "Admin", "UI"]:
        print(f'[Low] {f}: Unusual product_area ({product_area})')

