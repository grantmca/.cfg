#!/bin/zsh
# Take window to next screen
next_disp=$(yabai -m query --displays --display next)
if [[ -z "$next_disp" ]]; then
  yabai -m window --display first; yabai -m display --focus first;
else
  yabai -m window --display next; yabai -m display --focus next;
fi

