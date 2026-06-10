# teach-me

A socratic teaching mode for coding agents (Claude Code and OpenAI Codex).

Most agents "teach" by lecturing: they explain, you nod, and an hour later you
remember nothing. `teach-me` flips that. The agent reads the real code you want
to understand, builds a mastery checklist, and then makes you *earn* every
checkmark:

- **Trick questions by default.** Questions are designed so the
  surface-pattern answer is wrong — subtle code twists, counterfactuals
  ("why not just delete this guard?"), and textbook answers that fail in
  *your* codebase for a discoverable reason. Recall questions never count
  toward mastery.
- **No answer reveals.** Get one wrong and the agent won't tell you the right
  answer. It runs a socratic loop instead: a guiding question, the smallest
  possible hint, and a re-ask — escalating only as needed. Only after ~3
  failed rounds does it walk through the answer with you, and even then the
  concept gets re-tested later before it counts.
- **The troll.** Roughly one in three *correct* answers gets challenged anyway
  — "Are you sure? What about the retry path?" — with the agent arguing the
  wrong side convincingly. Hold firm with correct reasoning and you've proven
  real mastery; fold and you were pattern-matching. Every challenge is
  resolved honestly before moving on, so you're never left with a false
  belief.

The session ends when you've demonstrated understanding of everything on the
checklist — not when the agent finishes explaining.

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
