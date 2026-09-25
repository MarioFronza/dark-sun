#!/usr/bin/env bash
# Notify when Claude is waiting for input (Stop/Notification hook).
# Sound + tmux window highlight (red) + session alert if cross-session.

[ -z "$TMUX" ] && exit 0

window_target=$(tmux display-message -t "$TMUX_PANE" -p '#S:#I')
claude_session=$(tmux display-message -t "$TMUX_PANE" -p '#S')
active_session=$(tmux list-clients -F '#{session_name}' | head -1)

# Always highlight session if Claude is in a different one
if [ "$claude_session" != "$active_session" ]; then
  tmux set-option -t "$active_session" status-left "#[fg=#FFFFFF,bg=red,bold] #S #[bg=default] "
fi

# Skip sound + highlight only when you're actually looking: same window AND the
# terminal is focused. If you switched to another app (terminal unfocused, no
# "focused" in client_flags), notify even on the agent's own window.
active_window=$(tmux list-clients -F '#{window_index}' | head -1)
claude_window=$(tmux display-message -t "$TMUX_PANE" -p '#I')
focused=$(tmux list-clients -F '#{client_flags}' | head -1 | grep -q focused && echo 1)
if [ "$claude_session" = "$active_session" ] && [ "$claude_window" = "$active_window" ] && [ -n "$focused" ]; then
  exit 0
fi

# Sound
if command -v paplay >/dev/null 2>&1; then
  paplay /usr/share/sounds/freedesktop/stereo/complete.oga 2>/dev/null &
elif command -v canberra-gtk-play >/dev/null 2>&1; then
  canberra-gtk-play -i complete 2>/dev/null &
fi

# Highlight tmux window in status bar (reset happens on window enter via tmux hook)
tmux set-window-option -t "$window_target" window-status-format "#[fg=#FFFFFF bg=red bold] #I #W "
