# Updating this skill

The model landscape changes fast. This is the run-once refresh procedure that
keeps the skill current. Trigger it with `/update-prompt-optimizer` in Claude
Code, or by telling any Claude with this skill: "update the prompt-optimizer
skill following its MAINTENANCE.md."

Run it roughly quarterly, or whenever you hear of a notable new model.

## What to change vs. preserve

**Only refresh the model data.** Everything volatile lives in three files:

- `references/video-models.md`
- `references/image-models.md`
- `references/text-models.md`

**Never rewrite the method.** `SKILL.md` (the workflow, the "guide is the
product" principle, the mood taxonomy) is deliberately stable. Leave it alone
unless a genuinely new *technique* emerges (e.g. a new prompt structure a whole
class of models adopts) — and even then, change the minimum.

## The procedure

1. **Research current models, provider by provider.** For each family, confirm
   the models listed still exist, add notable new ones, retire discontinued
   ones, and update the prompting tips from the provider's own guidance.
   Start from these authoritative sources (search for the latest — versions in
   this list will themselves age):

   - **Video** — Google DeepMind (Veo), OpenAI (Sora), Kuaishou (Kling),
     ByteDance (Seedance), MiniMax (Hailuo), Alibaba (Wan), Lightricks (LTX),
     PixVerse, Shengshu (Vidu). Cross-check on fal.ai / Replicate release notes.
   - **Image** — Black Forest Labs (Flux), OpenAI (GPT Image), Google (Nano
     Banana / Gemini image), ByteDance (Seedream), Alibaba (Qwen Image),
     Recraft, Midjourney docs, SDXL checkpoint pages (Juggernaut, DynaVision).
   - **Text/LLM** — Anthropic docs (Claude), OpenAI cookbook / prompting guide
     (GPT), Google AI docs (Gemini), xAI (Grok). For anything about Claude or
     the Anthropic API, use the `claude-api` skill if available rather than
     answering from memory.

2. **Rewrite only what the research supports.** For each family entry keep the
   existing format exactly: `### Family`, then `Negative prompt:` line, then a
   `Tips:` bullet list. Update the comparison table in `text-models.md` if the
   relative strengths have shifted.

3. **Hard rules — these protect trust:**
   - Cite a source (in your summary to the user, not in the files) for every
     model you add or every claim you materially change. If you can't find a
     source, don't add it.
   - Never invent a model, version number, or capability. If unsure whether
     something shipped, leave it out and note the uncertainty to the user.
   - Keep the writing style terse and specific, matching the existing tips.
   - Don't bloat: prune tips that no longer apply rather than only adding.

4. **Stamp the update.** Bump the date and version at the top of each reference
   file's header comment if present, and add a dated one-line entry to
   `CHANGELOG.md` summarizing what changed (models added/removed, notable tip
   changes).

5. **Repackage.** Run `scripts/repackage.sh` from the skill directory to
   produce a fresh `prompt-optimizer.skill`. If you're in the source repo,
   commit the changed files with a clear message.

6. **Report back.** Give the user a short summary: which models were added,
   removed, or re-rated, and the sources — so they can sanity-check before
   trusting the new version.

## If the web app is also in the repo

This project's `index.html` embeds the same model data in its `MODELS` array and
strategy objects. If it's present, offer to apply the equivalent changes there
too (new models with `spec` ratings, updated `tips` arrays) so the app and the
skill stay in sync — but treat that as a separate, confirmed step.
