#!/usr/bin/env bash

source bootstrap.sh

include utils/log.sh

bootstrap::finish

function main
{
  local -a args=()

  IFS=' '
  args+=($(cat "$HOME/.config/polybar/.runargs"))

  log::info "Reloading polybar instances using:"
  log::info "launch ${args[*]}"

  "$HOME/.config/polybar/launch.sh" -k "${args[@]}"
}

main "$@"
