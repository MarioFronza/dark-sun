# claude

[Claude Code](https://claude.com/claude-code) config: `CLAUDE.md` (global
instructions), `agents/`, `skills/`, `hooks/`, `settings.json`,
`statusline-command.sh` and a Tokyo Night `themes/` entry.

The two hooks talk to [`../tmux/`](../tmux/README.md). `notify-ready.sh`
plays a sound and paints the window and session red when a run finishes
somewhere you are not looking; tmux repaints them when you switch to it.
`agent-state.sh` writes `working`/`idle` per pane under `/tmp`.

Not tracked (machine or account specific, never commit):
`.credentials.json`, `sessions/`, `projects/`, `history.jsonl`,
`shell-snapshots/`, `session-env/`, `cache/`, `backups/`, `downloads/`,
`file-history/`, `paste-cache/`, `settings.local.json`.

`claude-code` and `rtk` are installed via
[`../packages/`](../packages/README.md). `rtk` is optional: it backs the
Bash hook in `settings.json` and trims command output before it reaches
the model. Check it with `rtk --version` and `rtk gain` — if `gain` is not
a subcommand, the `rtk` on `PATH` is reachingforthejack/rtk (Rust Type
Kit), a different tool with the same name.

`CLAUDE.md` and `RTK.md` are read on every request, so they stay short and
hold only instructions worth acting on. Language and framework conventions
belong in a project's own `CLAUDE.md` or `.claude/rules/`, where the
`/sync` skill maintains them and they cost nothing on unrelated work.

## Copy

47 files, so copy the trees rather than listing them:

```bash
mkdir -p ~/.claude/skills
cp claude/CLAUDE.md claude/RTK.md claude/settings.json claude/statusline-command.sh ~/.claude/
cp -r claude/agents claude/hooks claude/themes ~/.claude/
cp -r claude/skills/* ~/.claude/skills/
```

## Apply

`settings.json` still says `"theme": "dark"`, the built-in one.
`themes/tokyo_night.json` is copied in but not selected automatically —
pick it with `/theme` inside Claude Code.
