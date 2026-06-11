# Changelog

## 1.1.0 — 2026-06-10

- **Difficulty ramp:** questions start moderate and get subtler after streaks
  of clean wins; struggles adjust hints, never difficulty.
- **Confidence scoring:** learners rate gut confidence (1–5) on every
  checklist answer before anything resolves. The troll targets
  confident-and-correct answers; hesitant-but-correct answers get reinforced
  instead of challenged.
- **Boss question:** a final synthesis question spanning multiple checklist
  items gates the end of the session.
- **Calibration report:** the recap now reports overconfidence (sure but
  wrong) and underconfidence (right but hesitant).
- **Cross-session memory:** opt-in save of the session (checklist, struggles,
  calibration) to `.teach-me/<subject>.md`; later sessions on the same area
  open with retrieval checks on previously shaky items.
- **Gentle mode:** "go gentle" / "no trolling" drops the troll while keeping
  trick questions and the socratic loop, announced explicitly.

## 1.0.0 — 2026-06-10

Initial release.

- Socratic teaching skill for Claude Code and Codex, grounded in the real code
  of whatever project it runs in.
- Trick questions by default: subtle twists, counterfactuals, plausible
  misconceptions, and textbook traps. Recall questions never count toward
  mastery.
- Wrong answers enter a socratic loop (guiding question → escalating hints →
  re-ask) instead of an answer reveal; concepts failed 3 times are walked
  through together and re-tested later before they count.
- Troll mode: roughly one in three correct answers gets a convincing
  devil's-advocate challenge. Holding firm proves mastery; folding re-enters
  the socratic loop. Every challenge is resolved honestly.
- Ships as a self-hosted plugin marketplace compatible with both
  `claude /plugin marketplace add` and `codex plugin marketplace add`, plus a
  Codex-tuned variant installable to `~/.agents/skills`.
