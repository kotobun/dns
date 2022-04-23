#!/bin/bash
if [[ ${1:0:1} = '-' ]]; then
  EXTRA_ARGS="$*"
  set --
elif [[ ${1} == named || ${1} == "$(command -v named)" ]]; then
  EXTRA_ARGS="${*:2}"
  set --
fi

if [[ -z ${1} ]]; then
  echo "Starting named..."
  exec "$(command -v named)" -u bind -g ${EXTRA_ARGS}
else
  exec "$@"
fi
