# prompt-optimizer

Turns a rough idea into a prompt shaped for the **specific** AI model you're
targeting — image (Flux, Midjourney, GPT Image, Seedream, Nano Banana, Qwen…),
video (Veo, Sora, Kling, Seedance, Hailuo, Wan…), or text/LLM (Claude, ChatGPT,
Gemini, Grok) — and hands back the *reasoning guide* alongside the prompt so you
can keep refining it. Includes a game/interactive-app prompt formula.

## Install

### claude.ai (web, desktop, mobile) — available across all your chats
- Open the `prompt-optimizer.skill` file card and click **Save skill** (shown
  if your organization allows skill creation), **or**
- Go to **Settings → Capabilities → Skills** and upload `prompt-optimizer.skill`.

### Claude Code (terminal) — available in your projects
The `.skill` file is a zip. Unzip it into a skills folder:
- **All your projects:** `unzip prompt-optimizer.skill -d ~/.claude/skills/`
  (you should end up with `~/.claude/skills/prompt-optimizer/SKILL.md`)
- **One project only:** unzip into that repo's `.claude/skills/` instead.

If you have the source folder rather than the `.skill`, just copy the
`prompt-optimizer/` directory into either location above.

## How to use it

**For a guaranteed run, invoke it by name** — writing a prompt is something
Claude often does from general knowledge without reaching for a skill:
- **Claude Code:** `/prompt-optimizer` (optionally with your request after it).
- **claude.ai:** start your message with "use the prompt-optimizer skill…".

It also triggers automatically on clearly model-specific or multi-part requests
(e.g. "optimize this for Kling and keep the face from morphing", or a full game
spec). Explicit invocation is simply the dependable path.

Example: `/prompt-optimizer a neon jellyfish drifting through deep space, for Sora`

## Keeping it current

The model rankings and per-family tips reflect research at packaging time and
will drift as new models ship. When the landscape moves, ask any Claude with
this skill to refresh `references/*.md`, then re-package.
