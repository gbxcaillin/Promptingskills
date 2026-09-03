# Changelog

Dated entries summarizing what each refresh changed. Newest first.
See MAINTENANCE.md for the update procedure.

## 2026-09-03 — full refresh (all four categories)
Text/LLM:
- Claude Fable 5.1 shipped Sep 1 (new flagship, 1M context; denser prose and
  less markdown — prompting fixes noted); Opus 5 framed as the everyday default.
- Gemini 3.8 Flash shipped Sep 2 (fast tier; intro pricing doubles Jan 2027);
  3.7 Flash credited with the WebDev Arena lead.
- Grok 4.7 announced (~mid-Sept), not shipped — noted, not added.
Image:
- Added Ideogram 4.0 (June 2026, open-weight; JSON-caption prompting, bbox
  layout, Layerize text layers; weights non-commercial) — previously excluded
  for lacking a primary source, now confirmed.
- FLUX 3 corrected: the image model is still unreleased; only FLUX 3 Video is
  GA (Aug 5). Retirements: Google Imagen deprecated; DALL-E out of ChatGPT.
- MAI-Image softened to "mixed, rising" (#1 image-editing leaderboard, shipping
  in PowerPoint/OneDrive/Foundry); Seedream banding still unfixed; Kling Image
  3.0 details; Nano Banana official-ID aliasing; merged a duplicate MAI section.
Video:
- New: Gemini Omni 1.1 Flash (chainable 40s extensions, first/last-frame,
  draft mode); MiniMax H3 Max by fal (5s clip in <3s, #1 I2V-with-audio).
- Sora 2 API death date pinned: Sept 24, 2026, no successor.
- Arena reshuffle: Wan 3.0 #1 T2V (rising, but no open weights); HappyHorse
  slid from #1 to mid-pack; Grok Imagine redemption arc (native 1080p killed
  the 720p complaint). Seedance "4K unseen" softened.
- Added a "notable families not yet fully profiled" list: Runway Gen-4.5,
  Luma Ray 3.2, Vidu S1, MAGI-2 Preview, HunyuanVideo-1.5.
Audio (delta on the 2-day-old data):
- Suno download caps confirmed in effect Sep 3 (free = 7 lifetime downloads,
  retroactive); Mureka V9.5 (Aug 31); Stable Audio reconciled to the v3
  family (GA May 2026); Breeze TTS 2 added; Sony's escalated suit v. Udio.

## 2026-09-01 — new audio/music category
- Added `references/audio-models.md`: a fourth model type covering music
  generation (Suno v5.5, ElevenLabs Music, Udio v4, Mureka V9, SongGeneration 2,
  Google Lyria 3.5 + RealTime, Stable Audio 2.5, ACE-Step 1.5, Riffusion,
  MusicGen), voice/TTS (ElevenLabs v3, Hume Octave 2, Gemini TTS/Chirp 3 HD,
  Azure Neural HD, MiniMax Speech 2.5, Fish Audio S2, OpenAI gpt-realtime,
  Cartesia Sonic 3, Chatterbox, Kokoro-82M), and sound effects (ElevenLabs
  SFX v2). Per-model prompting tips, a comparative-strengths table, a
  reception section, and free-access/licensing caveats.
- SKILL.md: audio added to the type table, reference routing, and step 3
  (three audio prompt shapes: music style+lyrics metatags, TTS script+delivery
  direction, SFX physical description). Method otherwise untouched.
- Notable calls: Suno v5.5 mixed (rollout backlash, watermark/download caps);
  Udio elite but download-locked post-settlement; ElevenLabs Music loved for
  human-passing vocals + clean licensing; Gemini TTS / MiniMax Speech sleepers
  (top TTS arenas, low buzz); PlayHT excluded (shut down after Meta
  acquisition, Dec 2025).
- (Web app gained the same 22 audio models with specs, sentiment, free tags,
  wizard path, and an Audio filter — 108 models total.)

## 2026-08-26 — sentiment layer + corrections
- Added a new provider: Microsoft MAI Image (MAI-Image-2.5, 2.5 Pro) with
  sourced prompting tips; ratings tempered from benchmark-inflated values and
  flagged as "unproven hype" in the sentiment layer (strong arena scores, thin
  real-world adoption).
- Correction: Gemini flagship is 3.1 Pro (the bare "3 Pro" endpoint retired);
  found on a forced re-sweep.
- Added a "Real-world reception" section to each reference file: community
  sentiment (mood + note + high-confidence rating nudges), dated and volatile,
  kept SEPARATE from the capability tips. Notable calls: Opus 5 reality gap
  (hallucination/over-confidence on long tasks), Fable 5/Sonnet 5 loved,
  Juggernaut Flux Pro / Z-Image / Recraft / Vidu / LTX 2.5 / PixVerse sleepers,
  GPT Image 2 / Seedream 5.0 Pro / Hailuo 2.3 / Sora 2 reality gaps.
- (Web app also gained a community-sentiment layer: reception chips, a
  Capability vs Community-adjusted ranking toggle, and reception notes.)

## 2026-08-26 — model refresh
Text/LLM:
- ChatGPT: family updated to GPT-5.6 (Sol flagship / Terra / Luna), superseding
  the GPT-5 Thinking/Instant/4o naming; comparison table relabeled.
- Grok: flagship updated to 4.6 (was 4.1).
- Gemini: added 3.7 Flash as the current fast tier (Pro stays 3 Pro).
- Claude: no change — Fable 5 / Opus 5 / Sonnet 5 / Haiku 4.5 confirmed current.
Image:
- Flux: noted FLUX 3 (early access, multimodal).
- Recraft: updated to V4.1 (incl. Vector / Utility / Pro).
- Midjourney: current default noted as V8.2.
Video:
- Veo: added 3.1 Fast and 3.1 Lite tiers.
- Wan: added Wan 3.0 (document/slide/spreadsheet-to-video).
- LTX: added LTX-2.5 (open weights, multishot, 4K HDR).
- Grok Imagine: noted July 2026 text-to-video, 1080p, voice reference, 7 anchors.
- Sora: flagged the app shutdown and scheduled Sora 2 API sunset (~Sep 2026).
- MiniMax H3: noted open-weight base release.
Sources recorded in the update conversation; some items (Sora sunset date, a few
API GA dates) were flagged for direct verification.

## 2026-08-26 — re-sweep additions
- Gemini: flagship corrected to 3.1 Pro (bare "3 Pro" retired).
- Added Microsoft MAI Image family (MAI-Image-2.5, 2.5-Pro) — top-3
  text-to-image / #2 image editing on LMArena; standout text rendering.
- Ideogram 4 seen in one roundup but not primary-sourced; not added.

## 2026-08-22 — initial release
- Video: Seedance, MiniMax, Hailuo, Kling, Veo, Sora, Wan, LTX, PixVerse, Vidu,
  HappyHorse, Gemini video, Grok Imagine.
- Image: Flux, GPT Image, Nano Banana, Seedream, Qwen Image, Recraft, Kling,
  Wan, Grok Imagine, Juggernaut, DynaVision, OpenArt, Z-Image.
- Text/LLM: Claude, ChatGPT/GPT, Gemini, Grok, plus the game-prompt formula and
  a comparison table.
