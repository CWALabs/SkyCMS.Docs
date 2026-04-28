import re

path = r'd:\source\SkyCMS.Docs\for-developers\website-launch\06-Preparing-for-Handoff.md'
with open(path, 'r', encoding='utf-8') as f:
    lines = f.readlines()

blocks = 0
for i, l in enumerate(lines):
    if '```' in l:
        blocks += l.count('```')
        print(f"Line {i+1}: {l.strip()}")

print(f"Total blocks: {blocks}, Broken: {blocks % 2 != 0}")

res = []
for i, l in enumerate(lines):
    if '`' in l:
        c = l.count('`')
        for _ in range(c):
            res.append(i+1)
for i in range(0, len(res), 2):
    if i+1 < len(res):
        print(f'{res[i]} - {res[i+1]}')
    else:
        print(f'{res[i]} - UNMATCHED')
