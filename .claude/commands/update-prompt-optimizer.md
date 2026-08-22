---
description: Refresh the prompt-optimizer skill's model data with current research
---

Run the prompt-optimizer skill's maintenance refresh.

1. Read `.claude/skills/prompt-optimizer/MAINTENANCE.md` and follow its
   procedure exactly.
2. Use web search to research current models per provider; only change what the
   research supports; never invent models; keep `SKILL.md` (the method) intact.
3. Update the three `references/*.md` files, add a dated `CHANGELOG.md` entry,
   then run `.claude/skills/prompt-optimizer/scripts/repackage.sh`.
4. Report a short summary of what changed (models added/removed/re-rated) with
   sources, and — if `index.html` is in this repo — offer to sync the app's
   MODELS data as a separate confirmed step.
