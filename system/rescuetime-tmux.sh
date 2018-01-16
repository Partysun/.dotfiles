#!/usr/bin/env bash
#source ~/Developer/tools/rescuetime-cli/rescuetime.txt
effTime=$(node ~/Developer/tools/rescuetime-cli/main.js);
echo '#[bg=colour234]|' $effTime '#[fg=colour254,bg=colour137,nobold]'
