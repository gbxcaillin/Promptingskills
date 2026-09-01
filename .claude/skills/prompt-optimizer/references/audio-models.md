# Audio / music model prompting reference

Audio splits into three prompt shapes. Identify which one the user needs first:

- **Music generation** (Suno, Udio, ElevenLabs Music, Mureka, Lyria, Stable
  Audio, ACE-Step, SongGeneration, Riffusion, MusicGen) — the prompt is a
  style description (genre, mood, instrumentation, tempo, production era),
  usually paired with lyrics carrying structure metatags like `[Verse]` /
  `[Chorus]`. Sub-genre specificity beats adjectives: "shoegaze", not "rock".
- **Voice / TTS** (ElevenLabs v3, Hume Octave, Gemini TTS, Azure, MiniMax
  Speech, Fish Audio, OpenAI, Cartesia, Chatterbox, Kokoro) — the prompt is
  the *script to speak* plus delivery direction. Direction syntax differs per
  model: inline bracket tags, a separate instructions field, plain-English
  acting notes, or SSML. Punctuation is pacing everywhere: ellipses hesitate,
  dashes cut, CAPS emphasize.
- **Sound effects / foley** (ElevenLabs SFX, Stable Audio) — the prompt is a
  concrete physical description: material + action + environment + temporal
  shape ("heavy wooden door slamming shut in a stone cathedral; starts quiet,
  builds to a metallic crash, long reverb tail").

Negative prompts: only some music models have an exclude-styles field; no TTS
model does (steer with direction instead). Map unlisted models to the closest
entry and say so.

## Music generation

### Suno
Negative prompt: "aggressive screaming, distorted metal guitar, lo-fi, spoken word" (Exclude Styles field)
Tips:
- Split the two boxes: Style box = global sound (genre, production, key instruments, vocal identity, mood); Lyrics box = the words + section structure only
- Top-anchor the style: lead with vocal role + genre, e.g. 'Female pop vocalist, breathy, intimate, 90s R&B groove' — this locks identity before lyrics are parsed
- Use recognized structure metatags: [Intro] [Verse] [Chorus] [Bridge] [Outro]; custom tags like [My Special Section] are ignored
- Keep style tags to ~15-30 words; over-stuffing dilutes adherence
- Punctuation is phrasing: commas, dashes and ellipses in lyrics become micro-pauses and breaths
- Use the Exclude Styles field to steer away from unwanted genres
- Suno Studio (paid) adds multitrack editing, stem separation and MIDI export

### ElevenLabs Music
Negative prompt: "acoustic, repetitive structure, four-on-the-floor kick, lo-fi" (Exclude Styles)
Tips:
- Every prompt implicitly answers five questions — genre, mood, instrumentation, tempo, production era — so state all five
- Be concrete on genre and era: 'energetic 1980s synth-pop, driving drum machine, male vocals', not 'rock'
- Build section by section: generate the Intro, then Continue to add Verse, Chorus, Breakdown, Outro for granular control
- Call out specific instruments ('prominent slap bass, funky rhythm guitar, horn section')
- Steer with a ~30s audio reference; Music Finetunes (5-10 min of audio) builds a custom style
- Reach for it specifically when the vocal has to pass as human in a commercial context (licensed training data, cleanest clearance story)

### Udio
Negative prompt: null (steer with positive specifics)
Tips:
- Be sub-genre specific ('shoegaze', not 'rock') and name the production era ('80s reverb-heavy synth pop')
- Describe production texture explicitly: 'warm analog', 'crisp digital', 'lo-fi tape'
- Learn Manual Mode — a genuine expert mode, not an 'off switch'; treating it casually tanks quality
- Use Magic Edit (inpainting) to regenerate one waveform section without rerolling the whole track
- Use Stem Separation 2.0 to export vocals/bass/drums/other with strong phase coherence
- Check download availability before committing — exports restricted since the label settlements (mid-2026)

### Mureka
Negative prompt: null
Tips:
- Lead with lyrics — it composes around your words, so paste them first
- Configure genre, mood, tempo and instrumentation as explicit parameters, not just prose
- Use Reference Mode: upload a track you like and it generates in a similar sonic style
- Export stems (5- or 12-stem) and MIDI to finish the track in a DAW
- Use voice cloning to keep a consistent vocalist across multiple songs

### Lyria (Google)
Negative prompt: "vocals, distortion, low fidelity, dissonant" (Vertex exposes negative_prompt)
Tips:
- Be descriptive and specific with adjectives; name genre, mood, key instruments and rhythmic feel
- Include lyrics either as a theme or as exact words in quotes
- Reference verse/chorus/bridge boundaries — Lyria 3.5 tracks song structure
- Specify tempo and duration explicitly
- MusicFX surfaces stack up to ~10 independent prompts, each acting as a separate 'track' in the mix
- Lyria RealTime is live steering, not one-shot: adjust weighted prompts mid-stream for interactive apps and generative backgrounds
- Output carries a SynthID watermark; training data is licensed

### Stable Audio
Negative prompt: "vocals, singing, lyrics, low quality, muddy mix"
Tips:
- Follow the formula: subject + genre + instruments + mood + tempo + key + production style + duration
- Always add BPM for sync-critical work: '...105 BPM'; add a key for theory-aware output: 'Key of C minor'
- Name specific sound sources, then add texture ('dusty vinyl crackle, warm Rhodes piano') to escape generic results
- Use audio-to-audio and inpainting to transform or repair uploaded audio
- Built for instrumental beds and sound design — do not expect strong lead vocals

### ACE-Step (open weights)
Negative prompt: null
Tips:
- A simple prompt works — the built-in planner expands it into style, lyrics and arrangement metadata
- Or supply your own lyrics + style descriptors to override the planner
- Runs on modest consumer GPUs (<4GB VRAM); iterate with fast rerolls, or drive it via ComfyUI
- Validate by ear — its benchmark wins flatter it against the polish of top commercial vocals
- Apache 2.0: output commercially usable, model free to fine-tune

### SongGeneration (Tencent, open weights)
Negative prompt: null
Tips:
- Feed clean, well-punctuated lyrics — its edge is lyric/phoneme accuracy (measured better than Suno/Mureka)
- Choose the output mode: vocals + accompaniment, pure instrumental, a cappella, or dual-track separated
- Add a prompt-audio reference to guide style (~6GB extra VRAM)
- State the target language explicitly (Chinese, English, Spanish, Japanese, more)
- Runs locally on 10-16GB VRAM; expect a researcher's UI, not a consumer product

### Riffusion
Negative prompt: null
Tips:
- Describe the full vibe in plain language — genre, mood, instrumentation, tempo; forgiving of natural prose
- It personalizes to your history: like/remix/download what you want more of
- Seed from text, an audio clip, or an image when prose drifts
- Free and effectively unlimited — treat generation as cheap iteration for ideation and demos, not final masters

### MusicGen (Meta, open weights)
Negative prompt: null
Tips:
- Instrumental only — vocals are effectively unusable
- Use melody conditioning: reference melody + text style prompt
- Keep prompts genre/mood/instrument focused; generate short segments and continue (long-form coherence is weak)
- A dated but hackable baseline; weights are CC BY-NC (non-commercial)

## Voice / TTS

### ElevenLabs (v3)
Negative prompt: null (not supported — direct the performance instead)
Tips:
- Direct with inline audio tags in brackets — [whispers], [laughs], [sighs], [excited], [sarcastically] — placed right before the words they affect
- Style and accent tags work too ([pirate voice], [French accent]) but expect variance; regenerate to land the read
- Multi-character scenes: use Text-to-Dialogue mode, not one stuffed call
- Punctuation drives pacing: ellipses hesitate, em-dashes cut, CAPITALS push emphasis
- For flat neutral long-form (audiobooks) many users still prefer v2/Flash — v3 is for acting, not consistency
- Professional Voice Cloning (30+ min clean audio) beats Instant clone for narration
- Give surrounding context — v3 reads emotional subtext, so bare lines underperform

### Hume (Octave)
Negative prompt: null
Tips:
- An LLM that understands what it says — give natural-language acting notes ('whisper fearfully', 'sound sarcastic and tired')
- Provide semantic context, not just the line; it infers emotion from meaning
- Design voices by description in the playground, then reuse the voice ID via API
- For turn-taking apps use EVI (speech-to-speech) paired with an external LLM for content
- Prefer it for expressive VO and characters over high-volume low-latency agents

### Google (Gemini TTS / Chirp 3 HD)
Negative prompt: null
Tips:
- Gemini-TTS takes plain-English style prompts — describe tone, pace, accent, emotion before the line
- Chirp 3 HD voices are named <locale>-Chirp3-HD-<voice>; pick explicitly, set the locale rather than autodetecting
- Chirp instant-clones from a short reference clip; Gemini-TTS is the directable-style path
- Classic Cloud TTS still accepts SSML (<break>, <phoneme>) for deterministic pause/pronunciation control

### Azure (Neural HD)
Negative prompt: null
Tips:
- Best-in-class SSML: <break>, <prosody>, <emphasis>, <phoneme>, <lang> give precision LLM-TTS models cannot match
- <mstts:express-as style='...' styledegree='2'> for emotion on supported voices
- Fix names/brands deterministically with <phoneme> or a custom lexicon
- Personal Voice cloning gates behind consent verification and Limited Access approval

### MiniMax Speech
Negative prompt: null
Tips:
- HD for audiobooks/VO (rhythm-stable), Turbo for realtime
- Clone from ~10s of clean single-speaker audio
- Set emotion explicitly (happy/sad/surprised/angry) rather than hoping context carries it
- Strong native accents across 30+ languages — set target language, don't mix scripts in one call

### Fish Audio
Negative prompt: null
Tips:
- Word-level emotion tagging (S2): spike specific words rather than styling the whole line
- Zero-shot clone from 10-30s; more clean reference audio improves fidelity
- S1 is the low-latency default (<150ms), S2 Pro the expressive-quality pick
- Open fish-speech repo runs locally; match reference language to target for cross-lingual work

### OpenAI (gpt-realtime / gpt-4o-mini-tts)
Negative prompt: null
Tips:
- Steer with the separate instructions field ('calm, professional, slightly warm; slow pace'), not by editing the spoken text
- Instructions set accent, emotion, intonation, impressions, speed, whispering — direct it like a voice actor
- No cloning — pick the closest built-in voice and steer
- gpt-realtime is speech-to-speech: persona + tone rules go in the system prompt; it handles interruptions and mid-sentence language switches
- Prototype tone free on openai.fm before wiring the API

### Cartesia (Sonic)
Negative prompt: null
Tips:
- Built for realtime agents; budget ~166-190ms real end-to-end latency (vendor ~90ms is model-only)
- Hand-tune pitch/speed/emotion to avoid a robotic read — don't rely on defaults
- Chunk text at natural clause boundaries to keep streaming prosody smooth
- Pick Sonic when latency is the product; go elsewhere when audio quality matters more

### Chatterbox (Resemble, open weights)
Negative prompt: null
Tips:
- Emotion-exaggeration parameter: one knob from monotone to dramatic
- Zero-shot clone from ~5s of clean audio; Turbo variant for realtime on modest hardware
- MIT-licensed for commercial self-hosting — still get consent for any cloned voice
- Outputs carry Resemble's PerTh watermark

### Kokoro (open weights)
Negative prompt: null
Tips:
- 82M params, realtime on CPU — the cost/privacy pick, not the expressive one
- No cloning, no emotion tags: steer only by voice choice and natural punctuation
- ONNX/MLX builds for edge deployment; pair with an OpenAI-compatible server wrapper
- Narration and UI readouts, not acting or singing

## Sound effects

### ElevenLabs SFX
Negative prompt: null
Tips:
- Be concrete about material, size, distance, environment: 'heavy wooden door slamming shut in a stone cathedral' beats 'door sound'
- Describe the temporal shape: 'starts quiet, builds to a metallic crash, long reverb tail'
- Mix onomatopoeia with description ('whoosh then thud') to disambiguate
- Set duration (0.5-22s); enable looping for ambient beds
- Tune prompt-influence: lower for variety, higher for literal adherence
- Layer complex scenes: generate impact, tail and ambience separately, mix in a DAW
- Video-to-Sound auto-places foley against on-screen action

## Comparative strengths (1-10, for recommending a model)

| Model | Songs & vocals | Instrumental | Voice/TTS | SFX | Control | Speed/value |
|-------|:---:|:---:|:---:|:---:|:---:|:---:|
| Suno v5.5 | 10 | 8 | — | 3 | 8 | 8 |
| ElevenLabs Music | 9 | 7 | 6 | 3 | 8 | 8 |
| Udio v4 | 9 | 9 | — | 2 | 9 | 7 |
| Mureka V9 | 8 | 7 | 5 | 2 | 8 | 8 |
| SongGeneration 2 | 8 | 7 | — | — | 7 | 7 |
| Google Lyria 3.5 | 7 | 9 | — | 4 | 7 | 8 |
| Stable Audio 2.5 | 3 | 9 | — | 8 | 8 | 10 |
| ACE-Step 1.5 | 7 | 7 | — | — | 7 | 10 |
| ElevenLabs v3 | — | — | 10 | — | 9 | 6 |
| Hume Octave 2 | — | — | 9 | — | 9 | 6 |
| Gemini TTS / Chirp 3 HD | — | — | 9 | — | 8 | 8 |
| Cartesia Sonic 3 | — | — | 7 | — | 7 | 10 |
| ElevenLabs SFX v2 | — | — | — | 10 | 6 | 9 |

Rough guide: Suno or ElevenLabs Music for finished vocal songs (ElevenLabs when
it must clear commercial use); Udio for production quality if downloads work for
you; Stable Audio or Lyria for instrumental beds; ElevenLabs v3 or Hume for
expressive narration; Cartesia or OpenAI realtime for live agents; ElevenLabs
SFX for foley; ACE-Step / SongGeneration / Kokoro / Chatterbox for open-weights
self-hosting.

## Real-world reception (community sentiment — Sep 2026, volatile)

Separate from the capability tips above; directional, not measured.

- **Suno v5.5** — mixed: still the vocal-song default, but the v5.5 rollout drew
  heavy backlash over output changes, pricing, and download caps/watermarking;
  Studio's stems/MIDI are genuinely valued.
- **Udio v4** — mixed: the audiophile's choice on quality, but the
  post-settlement download lockdown gutted practical value; Sony still litigating.
- **ElevenLabs Music** — loved: top pick when the vocal must pass as human;
  cleanest licensed-data/commercial-clearance story (excludes film/TV/games on
  self-serve).
- **ElevenLabs v3** — mixed: expressive tags are inconsistent; many still prefer
  v2 for neutral long-form.
- **ElevenLabs SFX v2** — loved: outputs rated indistinguishable from recorded
  foley in blind tests.
- **Hume Octave 2** — loved: genuinely differentiated emotional acting; gripe is
  developer-only accessibility.
- **Gemini TTS / MiniMax Speech** — sleepers: top the TTS arenas with far less
  creator buzz than ElevenLabs.
- **Cartesia Sonic** — mixed: latency king, mid-pack on pure quality, needs
  hand-tuning.
- **Mureka / Stable Audio / Lyria / SongGeneration / Kokoro** — sleepers:
  each quietly beats its billing in a niche (producer control, licensed
  instrumental beds, free uncapped MusicFX, lyric accuracy, size/cost).
- **ACE-Step** — mixed: astonishing speed on cheap hardware; "beats Suno"
  benchmark claims not matched by finished-track polish.
- **Riffusion / MusicGen / Chatterbox / Fish Audio** — loved by their
  communities (free/no-signup; the OSS baseline; one-knob emotion; self-host
  favorite), with fidelity caveats vs. the paid leaders.

## Free access & licensing caveats (checked Sep 2026)

Every model above has an official free path, but the strings attached differ:

- **Free tiers, non-commercial or capped:** Suno (older model only), Udio,
  ElevenLabs (music ~7 songs/day; TTS watermarked; SFX ~50/mo), Mureka,
  Stable Audio, Riffusion (uncapped), Hume, Cartesia, MiniMax; Google MusicFX
  is free and uncapped; openai.fm is a free no-signup TTS demo; Google Cloud
  and Azure have free monthly quotas.
- **Open weights, commercial-friendly:** ACE-Step (Apache 2.0), Kokoro
  (Apache 2.0), Chatterbox (MIT), Fish Audio, SongGeneration (Hugging Face).
  MusicGen weights are CC BY-NC (non-commercial).
- **Watch for:** label lawsuits/settlements reshaping Suno and Udio terms;
  SynthID/PerTh/Suno watermarking in outputs; voice-cloning consent
  requirements (legal and ethical) on every cloning path, open or hosted.
