#!/bin/zsh
# Take window to next screen
next_disp=$(yabai -m query --displays --display next)
if [[ -z "$next_disp" ]]; then
  yabai -m display --focus first;
else
  yabai -m display --focus next;
fi

