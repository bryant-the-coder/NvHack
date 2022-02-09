#!/usr/bin/env bash

get_time() {
  tail -1 tmp | cut -d ' ' -f 1
}

pf() {
  printf '%s : ' "$@"
}

echo "Warmup #1" ; nvim
echo "Warmup #2" ; nvim

pf "No config"
nvim -nu NORC --startuptime tmp; get_time

pf "With config"
nvim --startuptime tmp; get_time

pf "Fastest config"
nvim -nu "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.lua" --startuptime tmp; get_time

pf "Opening init.lua"
nvim "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.lua" --startuptime tmp; get_time
