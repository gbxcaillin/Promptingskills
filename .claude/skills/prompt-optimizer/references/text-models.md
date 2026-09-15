# Text / LLM prompting reference

For LLMs you **restructure** the rough prompt into the architecture the family
responds to — you do not append decorative phrases. Templates below; the
family tips (with the negative-prompt note, which is always "not applicable")
follow as the guide.

## Restructuring templates

**Claude** — XML-tagged, role-led, rationale-attached, ambition stated:
```
You are [role].

<task>
[user's request]. Deliver a complete, [ambition level] result.
</task>

<constraints>
- [each constraint, with the why attached]
</constraints>

<guidelines>
- Commit to distinctive, specific choices over safe generic ones.
- Go beyond the basics: deliver a complete, fully-realized result.
</guidelines>

If anything is ambiguous, make the most reasonable assumption and note it.
Before finishing, verify the result against the task above.
```

**ChatGPT / GPT** — Markdown sections, contradiction-free, verbosity controlled.
Reasoning models (GPT-6 Astra, GPT-5.6 Sol) get a high-level goal and NO
step-by-step; fast models (Luna, Terra) get an explicit "First plan…, then
build…, then verify". Astra also wants an explicit reasoning-effort level (it
has no default) and responds to a named slop-word blocklist:
```
# Role and Objective
You are [role]. Build exactly what is specified; where unspecified, choose the
most reasonable option and state it.

# Task
[user's request]

# Requirements / Style Rules
- [concrete requirements]
- (creative work) Avoid "not just X, but Y" reframes; replace rhetorical
  emphasis with a fact, example, or mechanism. Vary sentence length.

# Output Format
[what to produce; "no preamble, no recap"]

# Final Instructions
Keep going until fully resolved; make reasonable assumptions and note them.
```

**Gemini** — concise Persona / Task / Context / Format, context first, ask last,
no filler:
```
Persona: You are [role].
Task: [imperative goal].
Context:
[all reference material]
Format: [output shape]; deliver the length the work deserves. If a sentence
sounds like a template, rewrite it. Verify every requirement before finishing.
```

**Grok** — lean, surgical, tone locked, assumptions listed separately, built to
iterate:
```
Role: You are [role]. Tone: [explicit].
Goal: [request]
Constraints:
- [only the relevant context; convert every adjective to a specification]
Output: the result, then any assumptions listed separately from what was
specified. We will refine in short follow-ups, so keep it easy to revise.
```

## Game / interactive-app formula (inject when the prompt is about a game)

Detect game intent (game, platformer, shooter, arcade, roguelike, RPG, puzzle,
playable, etc.) and fold this into whichever family template applies:

- **Role**: a developer who ships polished [genre] browser games.
- **Goal**: one sentence naming the game and the feeling/player fantasy.
- **Core loop**: the repeated ~60-second cycle (spawn → action → resolve → score).
- **Controls**: exact inputs (keyboard + touch), shown on screen at load.
- **Win/lose**: explicit victory and failure states; what game-over and restart do.
- **Must ship**: 3–5 mechanics, no more.
- **Tech constraints** (highest-leverage line): "One self-contained HTML file,
  inline CSS, vanilla JS, no external libraries, no build step. No image or
  audio files — draw all graphics with canvas primitives and synthesize sound
  with the Web Audio API, so it runs offline from a double-click.
  requestAnimationFrame with a fixed timestep. High score in localStorage."
- **Do-not-build list** to prevent scope creep (menus, settings, multiplayer…).
- **Edge cases**: name the genre's tricky rules (duplicate-letter coloring,
  solvable maze generation, precise collision — no tunneling or sticking).
- **Acceptance tests**: "Done when: [input] starts the game, the lose condition
  triggers, and restart fully resets score and state."

Common failure modes and the phrasing that prevents each: asset hallucination
(ban external files), scope creep (do-not-build list + "change only X"), silent
broken loops (acceptance tests + visible score from build one), physics bugs
(fixed timestep + precise-collision clause), unwinnable states (name the edge
case). Reliable fixes are structural constraints, not cleverer wishes.

## Comparative strengths (1–10, for recommending a model)

| Model | Creative writing | Game/app coding | Worldbuilding | Brainstorming | Instruction-following | Long documents |
|-------|:---:|:---:|:---:|:---:|:---:|:---:|
| Claude (Fable 5.1/5, Opus 5) | 10 | 9 | 9–10 | 8–9 | 10 | 10 |
| Gemini 3.1 Pro | 8 | 10 | 8 | 8 | 9 | 10 |
| GPT-6 Astra | 5 | 9 | 6 | 10 | 9 | 8 |
| ChatGPT / GPT-5.6 Sol | 6 | 9 | 7 | 8 | 9 | 7 |
| DeepSeek V4-Pro (open) | 6 | 9 | 6 | 8 | 7 | 7 |
| GLM-5.3 (open) | 6 | 8 | 6 | 7 | 8 | 9 |
| Grok 4.6 | 9 | 7 | 9 | 9 | 7 | 6 |

Rough guide: Claude for prose and agentic coding; Gemini for one-shot web games
and huge-context work; GPT-6 Astra for verifiable-answer reasoning, math, and
one-shot game/3D builds (but its prose is a weak point — Sol still writes
better); GPT-5.6 for spec-to-working-code; DeepSeek V4-Pro for spec-to-patch
single-shot code and GLM-5.3 for long agentic coding loops (both open-weights,
weak at prose); Grok for wild ideation and worldbuilding, prompted lean and
iterated fast.

## Family tips (the guide)

### Claude
Negative prompt: null (not supported — rewrite negatives as positives)
Tips:
- Current lineup (Sep 2026): Fable 5.1 (new flagship, Sep 1; 1M-token context) / Fable 5 / Opus 5 / Sonnet 5 / Haiku 4.5; Anthropic's docs suggest Opus 5 for most workloads and Fable 5.1 for the most demanding reasoning and long-horizon work
- Fable 5.1 writes denser prose than Fable 5 — ask explicitly for 'short paragraphs, varied sentence length' if you want airier writing; it also uses less markdown in chat, so old anti-formatting boilerplate can over-suppress
- Fable 5.1 emits 22-35% more output than Fable 5 and defaults to fewer status updates during long tool-calling turns; on capped plans, scope tasks tightly and set a lower reasoning effort (medium often beats high for clean style-following) to avoid burning session limits
- Fable 5.1's prompting guide: give a clear deliverable + action boundaries + a definition of 'finished' rather than micromanaging steps; explicitly tell it NOT to fix unrelated bugs or expand scope
- Claude follows instructions literally; state the ambition level ('go beyond the basics, fully-featured') or you get the minimum
- Structure prompts with XML tags: <task>, <context>, <constraints>, <examples>; Claude is trained to parse them
- Give Claude a role in the first line; one sentence measurably focuses tone and quality
- Put long reference material at the top and the actual request at the end (up to ~30% quality gain on long inputs)
- Attach the why to every hard constraint ('no external assets, because this must run offline'); Claude generalizes from rationale
- Say what to do, not what to avoid: 'write flowing prose paragraphs' beats 'do not use bullet points'
- For creative voice, paste a 2-3 paragraph writing sample to match rather than adjectives like 'vivid'
- Fight generic output with explicit aesthetic direction: named palette, typography, motion; ban the safe defaults
- Provide 3-5 diverse examples in <example> tags when format matters
- End with a self-check: 'Before finishing, verify the result against the constraints above'
- Use plain firm language; ALL-CAPS and 'CRITICAL: YOU MUST' cause over-triggering on newer Claude models
- For big builds, chain: design doc first message, implementation second, one targeted feature per message after

### ChatGPT
Negative prompt: null (not supported — rewrite negatives as positives)
Tips:
- Current lineup (Sep 2026): GPT-6 Astra is the new flagship (single model, no tiers; shipped Sep 3-4); GPT-5.6 (Sol = reasoning, Terra = balanced, Luna = fast, now the free default) stays available below it. Older GPT-5 Thinking/Instant and GPT-4o names are superseded
- Match the model to the job: Astra for verifiable-answer reasoning, math, agentic/browser tasks, and one-shot game/3D builds; Sol for creative writing (Sol still beats Astra on writing) and spec-to-code; Luna/Terra for cheap fast iteration
- Astra's prompting guide (new): structure as GOAL / CONTEXT / PRIORITY / AUTONOMY / TOOLS / OUTPUT / VERIFICATION / STOP-CONDITION; steer via five levers — initiative/follow-through, instruction-following, personality/writing style, subagent delegation, testing/verification
- Astra has NO default reasoning-effort level — set it explicitly ('reasoning effort: medium' is the common default); it kills AI-slop words if you ban them by name ('avoid: bottom line, leverage, delve, game-changer, seamlessly, testament to')
- Structure prompts with Markdown headers: # Role and Objective, # Instructions, # Output Format, # Context
- GPT burns reasoning on contradictions; scan your prompt and resolve any conflicting instructions before sending
- In long prompts, state critical instructions at the beginning AND repeat them at the end
- Reasoning tiers (Astra, GPT-5.6 Sol) want a high-level goal like briefing a senior colleague; skip 'think step by step'
- Fast tiers (GPT-5.6 Luna/Terra) want explicit steps spelled out: 'First plan..., then build..., then verify'
- Control verbosity explicitly: 'no preamble, no recap, at most 3 sentences after the code'
- Add persistence lines for multi-step work: 'keep going until fully resolved; make reasonable assumptions rather than asking'
- Ban the AI-voice patterns by name: 'avoid not-just-X-but-Y constructions; replace rhetorical emphasis with a fact, example, or mechanism'
- Anchor creative voice with a 100-300 word sample to match, never adjectives alone
- For iteration turns, scope the edit: name the exact element to change and cap the blast radius ('change only the jump physics')
- Use a self-reflection rubric for one-shot builds: 'first define what makes a world-class result, then meet that bar'
- Re-state formatting and style rules every few messages in long chats; compliance decays
- GPT-6 Pro is a higher-reasoning Astra tier inside ChatGPT ($100/$200 Pro, Business, Enterprise — not Plus), not a separate model; prompt it exactly like Astra

### DeepSeek & GLM (open-weights coding)
Negative prompt: null (not supported — rewrite negatives as positives)
Tips:
- Both are open-weights, self-hostable, and strong on code but weak at prose — reach for them on the coding/app-building lane, not creative writing
- DeepSeek V4-Pro (1.6T MoE, Aug 2026) is the single-shot spec-to-patch specialist: give it a COMPLETE spec plus full function/file context and ask for the diff/patch directly; it excels at well-specified one-shot generation over back-and-forth
- GLM-5.3 (Zhipu, 743B, Aug 2026) is the long agentic-loop pick: decompose the task into explicit multi-step plans, give repo context and a clear success criterion, and let it run hours-long agent loops; it plans better than it single-shots
- Rule of thumb: DeepSeek for "here's the spec, produce the patch"; GLM for "work this repo autonomously toward this goal"
- Both are fine for high-iteration loops thanks to low/flat open pricing; for prose, worldbuilding, or nuanced instruction-following, route to Claude or Gemini instead

### Gemini
Negative prompt: null (not supported — rewrite negatives as positives)
Tips:
- Current models: Gemini 3.1 Pro (flagship), Gemini 3.8 Flash (fast tier, Sep 2 2026; 3.7 Flash still live one tier back). 3.8 Flash intro pricing roughly doubles Jan 1, 2027
- Use the PTCF structure Google recommends: Persona, Task, Context, Format
- Be concise and direct; Gemini 3 over-analyzes verbose, persuasion-heavy prompts, so keep instructions tight imperatives
- Context first, ask last: put all reference material above and the instruction at the very end
- Gemini defaults to terse output; explicitly ask for length or a conversational voice when you want it
- Include 1-2 few-shot examples with identical formatting; inconsistent example formatting produces malformed output
- Separate instructions from data with XML-style tags or Markdown headers
- Top-ranked at one-shot web games: give the full spec in one structured prompt and it follows every part
- Exploit the 1M-token context: paste an entire lore bible or design doc as context for consistent continuations
- Kill AI voice explicitly: 'avoid corporate jargon; if a sentence sounds like a template, rewrite it'
- If output disappoints, rephrase or reorder the prompt rather than adding pleading; strip filler words entirely
- End with a self-check: 'verify the result runs without errors and meets every requirement above'

### Grok
Negative prompt: null (not supported — rewrite negatives as positives)
Tips:
- Grok 4.6 is current; 4.7 is announced for ~mid-Sept 2026 but not shipped
- Iterate fast instead of perfecting: three quick attempts with refinements beat one 30-minute mega-prompt
- Be surgical with context; include only the relevant material, never a whole project dump
- Grok is literal: convert every adjective into a specification ('fun' becomes 'tight controls, escalating waves, combo multiplier')
- Lock tone explicitly ('direct, no jokes') or Grok keeps its default wit
- Counter its confidence bias: require assumptions listed separately from confirmed behavior
- Structure with the community template: Role, Context, Goal, Constraints, Output Format, Tone
- Standout at worldbuilding systems: ask for histories, faction agendas, timelines, and family trees explicitly
- Lean into unconventional ideation: 'give me 10 mechanics no shipped game has tried'
- For code, get the working core loop first with placeholder shapes; polish in separate turns
- Steer with short corrective follow-ups: 'tighten this', 'fix the collision bug, change nothing else'
- For prose, supply a voice sample; Grok's default register drifts flat or jokey without one


## Real-world reception (community sentiment — Sep 2026, volatile)

Separate from the capability tips above; these are community/reviewer signals,
dated and subjective. Weight them as directional, not measured.

- **Claude Opus 5** — reality gap: over-confidence/hallucination on long
  factual & agentic tasks (a calibration tradeoff) plus verbose output; top
  capability, "least enjoyable to work with". No fix shipped — Anthropic
  instead leapfrogged it with Fable 5.1. Nudge: instruction-following and
  brainstorming down.
- **Claude Fable 5.1** — loved: now #1 on the LMArena agent board, the Mazur
  debate benchmark, and the Artificial Analysis Intelligence Index (53.4, ahead
  of GPT-6 Astra 52.8 and Opus 5 50.7); beats Opus 5 on every published coding
  benchmark (gap widest on terminal-heavy tasks). (An Opus 5.1 is rumored but
  unverified — not shipped.) Wins head-to-head prose cadence vs Fable 5 and flags
  its guesses instead of inventing facts. Caveat: emits 22-35% more output —
  Max-plan users report burning session limits fast; medium effort often beats
  high for clean style-following. Nudge: writing, worldbuilding up.
- **Claude Fable 5** — loved: still #1 on the creative-writing arena board (5.1
  isn't listed there yet); prose "words fine, music slightly off" vs 5.1. Nudge:
  writing, worldbuilding up.
- **Claude Sonnet 5** — loved: wins writing quality and instruction-following
  at a large price undercut. Nudge: writing, instruction up.
- **Claude Haiku 4.5** — sleeper: punches above its price on coding/vibe-coding.
- **GPT-6 Astra** — mixed/dominant-but-narrow: crushes verifiable-answer tasks,
  math, and agentic/one-shot game+3D builds (FrontierMath, browser games in a
  day), but creative writing is a genuine weakness — ranks *below* GPT-5.6 Sol
  on writing benchmarks, "no personality, reads as machine-written". Reach for
  it for reasoning/agents, not prose. Nudge: brainstorming up, writing down.
- **GPT-5.6 Sol** — mixed: still OpenAI's *best writing model* (beats Astra on
  writing Elo) and strong long-horizon coding; benchmark leadership contested as
  partly test-gamed. Nudge: coding up.
- **GPT-5.6 Luna** — mixed: repetitive, shallow on long-form creative; now the
  ChatGPT free/Go default. Nudge: writing down.
- **Gemini 3.1 Pro** — reality gap: reasoning gains but reduced warmth and
  in-session drift (drops constraints); excellent long-doc/code review. Nudge:
  writing and instruction down, long documents up.
- **Gemini 3.7 Flash** — sleeper: value pick for low-cost coding/agents and
  *still the WebDev Arena leader* for one-shot web builds. Nudge: coding,
  instruction up.
- **Gemini 3.8 Flash** — hype deflated to specialist: did NOT take the WebDev
  lead (debuted #18; 3.7 still leads), slow first-token (~13s) and heavy token
  bloat make it poor for interactive use — but decent for overnight batch and
  long-horizon agentic work. "Matches Opus 5" only on cherry-picked benchmarks.
  Nudge: none (use 3.7 for the fast lane).
- **Grok 4.6** — reality gap: best-in-class real-time research; "robotic"
  writing and weaker real-world coding than benchmarks imply. Nudge: writing and
  coding down, brainstorming up. (Grok 4.7 has now missed two dates and still
  isn't shipped as of Sep 15; 4.8/4.9 are roadmap talk only — 4.6 stays current.)
- **DeepSeek V4-Pro** — strong (open): highest open-weight SWE-bench Verified;
  the community's spec-to-patch codegen pick. Its planned Sep 14 retirement was
  cancelled, so it stays current. Weak at prose.
- **GLM-5.3** — the momentum pick (open): ~50% coding gain over 5.2 and emergent
  cybersecurity/audit strength on long agentic loops; lags DeepSeek on one-shot
  codegen. Weak at prose.
