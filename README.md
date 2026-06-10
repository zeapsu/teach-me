# teach-me

A socratic teaching mode for coding agents (Claude Code and OpenAI Codex).

You know the feeling: the agent ships a change, walks you through it, you nod
along, and a week later you couldn't explain any of it to save your life. That's
not learning — that's vibing. `teach-me` is for when you actually want the
thing in your head.

So instead of lecturing, the agent reads the real code you want to understand,
builds a mastery checklist, and makes you *earn* every checkmark:

- **Trick questions by default.** No softballs. Every question is built so the
  surface-pattern answer is wrong — subtle code twists, counterfactuals ("why
  not just delete this guard? it looks redundant"), and textbook answers that
  fail in *your* codebase for a reason you can actually find. Simple recall
  questions never count toward mastery.
- **No answer reveals.** Got one wrong? Tough — the agent won't tell you the
  right answer. It nudges instead: a guiding question, the smallest possible
  hint, and a re-ask. Only after ~3 failed rounds does it finally walk through
  it with you, and even then the concept gets quietly re-tested later before
  it counts.
- **The troll.** This is the fun part. Roughly one in three *correct* answers
  gets challenged anyway — "are you sure? what about the retry path?" — with
  the agent arguing the wrong side convincingly. Hold firm with real reasoning
  and you've proven you actually get it; fold and you were pattern-matching
  all along. Every challenge gets resolved honestly before moving on, so
  you're never left wondering what the truth was.

The session ends when you've demonstrated understanding of everything on the
checklist — not when the agent finishes explaining.

Inspired by [Thariq's "teach me" skill](https://x.com/trq212/status/2061545633560010826)
([gist](https://gist.github.com/ThariqS/1389dcdff9eba4789887a2211370f06b)) —
this version turns the difficulty up: trick questions, no answer reveals, and
a troll.

## Quickstart

### Claude Code (plugin)

```text
/plugin marketplace add zeapsu/teach-me
/plugin install teach-me@teach-me
```

Then in any project:

```text
/teach-me the auth middleware you just changed
```

It also triggers naturally on phrases like "teach me", "quiz me", "make sure I
actually understand this", or "walk me through what you just did".

### Claude Code (manual)

```bash
git clone https://github.com/zeapsu/teach-me
cp -r teach-me/plugins/teach-me/skills/teach-me ~/.claude/skills/teach-me
```

### Codex (plugin)

Codex's plugin system understands the same marketplace format:

```bash
codex plugin marketplace add zeapsu/teach-me
codex plugin add teach-me@teach-me
```

### Codex (manual)

Codex auto-discovers skills in `~/.agents/skills/`. The `codex/` directory
holds a Codex-tuned variant (plain-text A–D answer prompts, `AGENTS.md`
conventions):

```bash
git clone https://github.com/zeapsu/teach-me
./teach-me/scripts/install-codex.sh
```

## What a session looks like

1. **Grounding.** The agent reads the actual files/diff/PR — never teaches
   from generic knowledge.
2. **Calibration.** One quick exchange: what do you want out of this, and how
   familiar are you already?
3. **Checklist.** A visible mastery map across three layers: the problem, the
   solution (and why it beat the alternatives), and the broader context.
4. **Incremental teaching.** You restate your understanding first; the agent
   teaches the gaps it finds, at the depth you pick (ELI5 → new-intern).
5. **Probing.** Trick questions tied to checklist items. Wrong answers enter
   the socratic loop; right answers sometimes get trolled.
6. **Recap.** When the checklist is genuinely done — including the traps you
   fell into and climbed out of, since those are what you'll remember.

## The rules the agent lives by

| Situation | What the agent does |
|---|---|
| You answer wrong | Never reveals the answer. Guiding question → smallest hint → re-ask. |
| You fail 3 rounds | Walks through it *with* you, doesn't check it off, re-tests later with a fresh question. |
| You answer right | ~1 in 3 of these get challenged anyway ("are you sure?"), argued convincingly. |
| You hold firm under challenge | Explicit concession: you were right, here's why the challenge was bogus. Checked off with honor. |
| You fold under challenge | Back into the socratic loop — you were guessing. |
| First question of the session | Never trolled. Trust first. |
| An answer you just struggled to earn | Never trolled. Hard-won wins stand. |

Every challenge is always resolved honestly before moving on. The troll exists
to calibrate your confidence, never to plant false beliefs.

## Repository layout

```
.claude-plugin/
  marketplace.json   # self-hosted marketplace (this repo IS the marketplace)
plugins/teach-me/
  .claude-plugin/plugin.json  # plugin manifest (Claude Code & Codex compatible)
  skills/teach-me/SKILL.md    # canonical skill (degrades gracefully on any agent)
codex/
  skills/teach-me/SKILL.md  # Codex-tuned variant for ~/.agents/skills
scripts/
  install-codex.sh   # copies the Codex variant into ~/.agents/skills
```

## Philosophy

Three ideas from learning science, applied to agent-assisted coding:

1. **Desirable difficulty.** Retrieval that requires effort produces durable
   memory. Easy recall questions feel good and teach nothing.
2. **Errorful learning with delayed correction.** Being wrong, then working
   your way to right, beats being told. The agent guides; it doesn't tell.
3. **Confidence calibration.** Knowing something and knowing *that* you know
   it are different skills. The troll tests the second one — a correct belief
   that survives a convincing counter-argument is the strongest mastery signal
   there is.

## License

MIT
