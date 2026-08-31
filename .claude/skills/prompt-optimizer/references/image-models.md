# Image model prompting reference

Each family below lists its **negative prompt** behavior and research-backed
**tips**. When optimizing:

- Keep the user's subject; add only missing elements (lighting, camera/lens,
  materials, composition, style) with mood-appropriate choices (SKILL.md).
- Strip quality tags (masterpiece, best quality, 4k) for models that ignore
  them (Flux, GPT Image, Nano Banana) and weight syntax `(token:1.4)` for
  models that don't support it (Flux family, Juggernaut Flux Pro).
- Wrap literal text-to-render in double quotes for models with strong text.
- Negative prompt `null` = rewrite negatives as positives ("sharp focus
  throughout" not "no blur"). Where a base negative set is given, include it.
- Map any unlisted model to its closest family (any SDXL checkpoint →
  Juggernaut/OpenArt SDXL conventions; any Midjourney-style service → lead with
  subject, name camera/lens and lighting, commit to one aesthetic; Midjourney's
  current default model is V8.2).

### Flux
Negative prompt: null (not supported — rewrite negatives as positives)
Tips:
- Natural language sentences, NOT keyword lists; FLUX.2 uses a 24B vision-language model (Mistral Small 3.2)
- Word order matters: lead with main subject, it gets the most attention
- Quality tags (masterpiece, best quality) provide MINIMAL benefit; remove them
- Weight syntax (beautiful:1.4) and Midjourney params (--ar, --v) are IGNORED
- NO negative prompt support on FLUX.2; rewrite negatives as positives: 'sharp focus throughout' not 'no blur'
- Camera/lens language is the highest-impact technique: 'Shot on Sony A7IV, 85mm f/1.4, shallow depth of field'
- Wrap literal text in quotes: a sign reading "OPEN 24 HOURS"; FLUX has industry-leading text rendering
- Hex color support: 'walls in hex #0047AB' for exact brand colors
- Guidance scale 2.5-3.5 is the sweet spot. Above 6.0 produces artifacts
- 30-80 words ideal. Elements beyond ~80 words get progressively ignored
- Kontext models: three-part edit structure; what to change, how, what to preserve
- For photorealism: specify camera body + lens + lighting setup, not 'realistic photo'
- FLUX 3 (early access, July 2026) is a unified multimodal model; the FLUX.2 guidance here still applies to current image work

### MAI Image
Negative prompt: null (not supported — rewrite negatives as positives)
Tips:
- Microsoft's first-party model (MAI-Image-2.5, MAI-Image-2.5-Pro; Pro is the quality-first tier)
- Write flowing natural-language descriptions, not comma-separated keyword tags
- Order subject -> style -> lighting -> composition -> mood; layer details together
- Put literal in-image text in single quotes with placement and style; text rendering is a standout strength (top-2 image editing on the arena)
- Specify camera/lens, lighting, and materials explicitly for photoreal or cinematic output
- For edits, describe one precise change and end with what must stay unchanged; surgical, layout-preserving edits with strong identity consistency
- Output caps at ~1 megapixel (~1024x1024); available via Azure AI Foundry, Copilot/PowerPoint, and OpenRouter

### GPT Image
Negative prompt: null (not supported — rewrite negatives as positives)
Tips:
- 6-slot framework: Subject+Action, Context/Setting, Style/Medium, Lighting, Camera/Composition, Mood+Constraints
- Natural language, like briefing a creative director; 30-80 words of clear, specific prose
- No negative prompt parameter; express constraints as inline exclusions at end: 'No watermark, no extra text'
- ~99% character-level text accuracy on GPT Image 2. Wrap exact copy in double quotes
- Specify font style: 'bold serif', 'thin sans-serif'. Add 'verbatim, perfectly legible' for critical text
- Include intended use early (ad, UI mockup, infographic) to set context
- Camera references work well: 'Shot on Leica Q3, 28mm f/1.7 lens'
- Avoid stacking generic praise ('stunning cinematic 8K masterpiece'); use visual facts instead
- Quality parameter: set to 'high' for small text, dense panels, close-up portraits
- Supports up to 4 reference images and transparent backgrounds (PNG/WebP)

### Nano Banana
Negative prompt: null (not supported — rewrite negatives as positives)
Tips:
- Narrative paragraphs, NOT keyword lists; Gemini-based architecture understands natural language
- No negative prompts; use 'semantic positive framing': 'sharp focus' instead of 'not blurry'
- Supports up to 14 reference images and 4K output
- Multilingual text rendering supported
- For photorealism: specify camera equipment and materiality; 'Shot on Canon R5, 85mm f/1.4'
- Multi-turn conversational editing is a core feature; refine iteratively
- Describe materials and textures explicitly for best results

### Seedream
Negative prompt: "blurry, low quality, distorted, artificial, plastic-looking, oversaturated"
Tips:
- Natural-language sentences, NOT keyword lists; the model reasons through prompts semantically
- Word order matters: lead with the main subject, style goes last
- Optimal prompt length: 30-100 words. Under 15 = generic, over 150 = conflicting
- Text rendering: double-quote exact strings, keep to 3-5 words, specify font and placement
- Version 4.5 has the best text rendering; 5.0 Pro adds thinking mode and character consistency
- Counter-intuitive realism: ask for imperfections; 'natural sensor noise, slight handheld imperfections'
- '4K' and '8K' in prompt text affect STYLE, not actual pixel output; set dimensions in API parameters
- For photorealism: describe specific camera body + lens combo

### Recraft
Negative prompt: null (not supported — rewrite negatives as positives)
Tips:
- Think like a designer, not a photographer; Recraft understands design intent
- Two modes: short prompts (model designs WITH you) vs. structured prompts (model EXECUTES your architecture)
- For SVG: use flat, geometric, 2-5 colors, no texture language; native vector/SVG output is unique to this model
- Always quote text that should render literally: 'a sign reading "HELLO"'
- Good for: icons, illustrations, design assets, brand materials, vector graphics
- Include brand style parameters if relevant
- Specify composition clearly: 'centered', 'rule of thirds', 'symmetrical layout'
- Current version is V4.1 (V4.1, V4.1 Vector, V4.1 Utility, V4.1 Pro at 2048x2048); V4.1 Vector is the native production-SVG generator

### Wan
Negative prompt: "blurry, distorted, low quality, deformed hands, unnatural proportions"
Tips:
- Formula: Subject + Action + Environment + Camera + Lighting + Style
- Wan 2.7 image: accurate text rendering on signs, labels, and posters; double-quote exact text
- Specify facial features explicitly for portrait control
- Separate primary subject from background to prevent visual noise
- For text rendering: double-quote strings, specify font style and placement

### Grok Imagine
Negative prompt: null (not supported — rewrite negatives as positives)
Tips:
- Natural language, written like a design brief; 30-80 words
- Negative prompts do NOT take effect; model ignores them entirely. Use positive framing only
- Commit to ONE aesthetic per prompt; do not mix conflicting styles
- Camera specs beat adjectives: 'Shot on Sony A7R V with 85mm f/1.2 lens' beats 'professional photo'
- Lighting is the single biggest quality driver: golden hour, Rembrandt, backlit, chiaroscuro
- Write text in CAPITALS for literal rendering. Put in quotes and describe placement
- Image 2.0: 'most legible typography in the family'; multilingual signage stays sharp
- Smart Resize: recomposes across 9 ratios (1:2 to 2:1) by filling, not cropping

### Kling
Negative prompt: "blurry, low quality, distorted, extra fingers, deformed hands, unnatural proportions"
Tips:
- Supports extracting features from up to 10 reference images
- Reference by image number: 'subjects from image 1 and image 2'
- Formula: 'Keep [subject]'s facial features, character has [hairstyle], wearing [clothing], performing [action], background is [setting]'
- When using elements, prompt should focus on ACTION and COMPOSITION; let the element handle appearance
- Include style transfer keywords for consistent aesthetics

### Qwen Image
Negative prompt: "blurry, low quality, pixelated, distorted, watermark, text overlay, signature, oversaturated, artificial, plastic-looking, extra fingers, deformed hands"
Tips:
- Structured labels over narrative prose; priority ordering matters (subject first, then environment, then details)
- 7-layer framework for 3.0: Goal, Canvas, Zones, Exact copy, Visual system, References, Validation rules
- Double-quote text: '"Aurora Festival 2026"'; bumps spelling accuracy from ~65% to ~85%
- Combined with CFG 7.0 and 50 steps, text accuracy reaches ~96%
- Keep to 1-3 sentences for Qwen 2.x. 3.0 supports up to 4,500-token prompts
- Negative prompts FULLY SUPPORTED via negative_prompt parameter; always include the base set
- Camera/lens references work well: 'Shot on Canon EOS R5, 85mm f/1.4 lens'
- CFG sweet spot: 4-5 general, 7-10 for text-heavy/product work
- prompt_extend: disable when your prompt is already detailed or you need reproducibility

### OpenArt
Negative prompt: "blurry, low quality, distorted, watermark, oversaturated, artificial skin"
Tips:
- Photorealistic variant: emphasize photorealism with natural skin texture and material detail
- SDXL variant: natural language sentences work better than tag lists on SDXL
- Include lighting direction and quality explicitly
- Describe materials and textures for best results
- Camera/lens specifications add significant quality

### Z-Image
Negative prompt: "blurry, low quality, distorted"
Tips:
- Good for rapid iteration; keep prompts focused and concise
- Describe the core visual concept clearly
- Include style keywords early in prompt; they get more weight
- Optimized for speed; simpler prompts produce faster, cleaner results

### Juggernaut
Negative prompt: "blurry, low quality, distorted, plastic skin, unrealistic, oversmoothed, artificial"
Tips:
- Juggernaut XL: REQUIRES three trigger words; 'skin textures', 'high resolution', 'cinematic'
- Keep prompts under 75 tokens for XL
- CFG 4-7 depending on version. Use hires.fix with LOWER CFG for detail; do not raise CFG
- Token bleed is the main pitfall with multi-subject scenes; keep subjects separate
- Juggernaut Flux Pro: built on FLUX architecture; NO negative prompts, NO weight syntax
- Flux Pro: two clean sentences outperform adjective chains. Euler Beta sampler, CFG 2.5 for photorealism
- Specify concrete materials: 'brushed steel', 'aged leather', 'weathered wood'
- Camera equipment: 'shot on Sony A7III, 50mm f/1.4' for realistic anchoring

### DynaVision
Negative prompt: "blurry, low quality, distorted, photorealistic, photograph"
Tips:
- Intentionally SIMPLE prompting; the 3D animation aesthetic (Pixar/DreamWorks/Disney) is baked in
- NEVER use the SDXL refiner with DynaVision; it degrades quality significantly
- Known issues with tall aspect ratios (causes neck elongation); stick to landscape or square
- Good for character art, product renders, stylized scenes
- Don't fight the 3D style; lean into it. Describe the scene, not the rendering technique

### MAI Image
Negative prompt: null (not documented — exclude unwanted elements by phrasing positively; when editing, state what to leave unchanged)
Tips:
- Microsoft's first-party model (MAI-Image-2.5, MAI-Image-2.5-Pro; Pro is the quality-first tier); ranks top-3 text-to-image and #2 image editing on the LMArena human-preference leaderboard
- Write flowing natural-language descriptions, NOT comma-separated keyword tags
- Order the prompt subject -> style -> lighting -> composition -> mood; layer details together
- Put literal in-image text in single quotes with placement and style; text rendering is its standout strength
- Specify camera/lens, lighting, and materials explicitly for photoreal or cinematic output
- State the style register up front: 'editorial product photography', 'architectural visualization', 'Ghibli-inspired'
- For edits, describe one precise change and end with what must stay unchanged; it does surgical, layout-preserving edits with strong identity consistency
- Best for text rendering (labels, posters, packaging, signage), photoreal hero/product imagery, portraits, and precise editing
- Output caps at ~1 megapixel (~1024x1024); available via Azure AI Foundry, Copilot/PowerPoint, and OpenRouter


## Real-world reception (community sentiment — Aug 2026, volatile)

Separate from the capability tips above; community/reviewer signals, dated and
subjective.

- **Juggernaut Flux Pro** — sleeper: fixes Flux's "wax skin"; best-in-class
  simple-prompt portraits.
- **Juggernaut XL** — mixed: loved for local uncensored photoreal; SDXL-era weak
  prompt/text adherence.
- **GPT Image 2** — reality gap: #1 on the arena but imprecise for exact graphic
  design/layout and degrades after repeated edits; text and realism strong.
- **Nano Banana 2** — mixed: best-in-class text/adherence; loud "flat/cartoonish"
  realism complaint; aggressive non-configurable safety.
- **Seedream 5.0 Pro** — reality gap: cheaper/less restrictive with strong
  adherence, but portraits regressed vs 4.5 and a banding artifact went unfixed.
- **Seedream 4.5** — loved: excellent dense typography and 10-reference editing;
  the portrait edge over 5.0.
- **Qwen Image 3.0** — sleeper: dense text/infographics across 12 languages;
  launched with no weights/benchmarks, drawing skepticism.
- **Recraft V4.1** — sleeper: only model with native editable SVG; uneven on
  anatomy/detailed prompts.
- **Z-Image** — sleeper: photoreal in under 3s on consumer GPUs.
- **Grok Imagine Image 2.0** — reality gap: quality fine, but over-censorship and
  a paywall erased the free/uncensored differentiator.
- **MAI-Image 2.5 / 2.5 Pro** — unproven hype: launched top-3 on the arena (text/editing gains) but organic adoption and hands-on sentiment are thin; treat ratings as benchmark-derived until real use accumulates.
- **Flux 2 Pro / Max** — mixed: strong multi-reference consistency; lingering
  "plastic/wax skin" in portraits.
- **FLUX 3** — unproven hype: image access barely released; benchmark framing
  ahead of real-world evidence. Treat cautiously.
- **Midjourney V8.2** — loved: top aesthetic quality and --sref/--cref
  consistency; historically weak literal text/prompt precision; billing gripes.
