cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> Copying claude config"
mkdir -p ~/.claude/skills
cp CLAUDE.md RTK.md settings.json statusline-command.sh ~/.claude/
cp -r agents hooks themes ~/.claude/
cp -r skills/* ~/.claude/skills/
