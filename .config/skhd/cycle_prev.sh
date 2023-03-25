#!/bin/zsh
# Take window to prev screen
prev_disp=$(yabai -m query --displays --display prev)
if [[ -z "$prev_disp" ]]; then
  yabai -m display --focus last;
else
  yabai -m display --focus prev;
fi


