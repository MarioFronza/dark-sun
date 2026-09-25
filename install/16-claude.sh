DARK_SUN=~/.local/share/dark-sun

echo "==> Copying claude config"
mkdir -p ~/.claude/skills
cp "$DARK_SUN"/claude/CLAUDE.md "$DARK_SUN"/claude/RTK.md "$DARK_SUN"/claude/settings.json "$DARK_SUN"/claude/statusline-command.sh ~/.claude/
cp -r "$DARK_SUN"/claude/agents "$DARK_SUN"/claude/hooks "$DARK_SUN"/claude/themes ~/.claude/
cp -r "$DARK_SUN"/claude/skills/* ~/.claude/skills/
