#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bg="#b4befe"
black="#1e1e2e"
fg="#313244"

spotify_listener=false

status="bottom"
justify="absolute-centre"

status_left=" #S "
status_left_formated="#[bg=default,fg=default,bold]#{?client_prefix,,${status_left}}#[bg=${bg},fg=black,bold]#{?client_prefix,${status_left},}#[bg=default,fg=default,bold]"
status_left_length=25

status_right="#($CURRENT_DIR/scripts/tmux-cpu/scripts/cpu_percentage.sh) | $(hostname) "
if [ "$spotify_listener" = true ]; then
  status_right="#($CURRENT_DIR/scripts/tmux-cpu/scripts/cpu_percentage.sh) | #($CURRENT_DIR/scripts/music.sh)"
fi

status_right_formated="#[bg=default,fg=default,bold]#{?client_prefix,,${status_right}}#[bg=${bg},fg=black,bold]#{?client_prefix,${status_right},}#[bg=default,fg=default,bold]"
status_right_length=70

window_status_format=' #I:#W '
expanded_icon="󰊓 "

title="#S:#W"

tmux set-option -g pane-active-border-style bg=default,fg=${bg}
tmux set-option -g pane-border-style fg=${fg}

tmux set-option -g status-position ${status}
tmux set-option -g status-style bg=default,fg=default
tmux set-option -g status-justify ${justify}

tmux set-option -g status-left "${status_left_formated}"
tmux set-option -g status-left-length "${status_left_length}"
tmux set-option -g status-right "${status_right_formated}"
tmux set-option -g status-right-length "${status_right_length}"

tmux set-option -g set-titles-string "${title}"

tmux set-option -g window-status-format " ${window_status_format}#{?window_zoomed_flag,${expanded_icon}, }"
tmux set-option -g window-status-current-format "#[bg=${bg},fg=${black}] ${window_status_format}#{?window_zoomed_flag,${expanded_icon}, }"
