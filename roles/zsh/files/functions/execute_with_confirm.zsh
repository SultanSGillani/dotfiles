#!/usr/local/bin/zsh

function execute_with_confirm {
  echo "\\n\\e[0;36mExecute:\\e[1;37m \`$@\`\\n"
  read "response?Are you sure? [y/n]: "

  if [[ ${response} =~ ^y ]]; then
    export __execute_with_confirm_executed="1"
    eval "$@"
  else
    export __execute_with_confirm_executed=""
    echo "Canceled."
  fi
}

function retriable_execute_with_confirm {
  execute_with_confirm "$@"
  local result=$?

  if [[ "$__execute_with_confirm_executed" = "1" ]]; then
    echo
    [[ $result = 0 ]] && echo "👼 Succeeded." || echo "👿 Failed."
    echo
    read "response?Retry? [y/n]: "

    if [[ ${response} =~ ^y ]]; then
      retriable_execute_with_confirm $@
    fi
  fi
}
