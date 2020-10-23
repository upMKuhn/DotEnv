#!/bin/bash

action="$1"
workspace="$2"

focused_workspace=$(i3-msg -t get_workspaces | jq --raw-output '.[]|select(.focused).name')
monitor=$(i3-msg -t get_workspaces | jq --raw-output '.[]|select(.focused).output')

active_postfix=${focused_workspace: -1}

target_workspace="${workspace}: ${monitor}"
echo "$target_workspace"
if [[ "$action" == "move" ]]; 
then
    i3-msg "move container to workspace $target_workspace"
    i3-msg "workspace $target_workspace"
else
    i3-msg "workspace $target_workspace"
fi