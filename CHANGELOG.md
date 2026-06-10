# Changelog

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
