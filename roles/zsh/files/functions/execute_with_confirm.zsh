execute_with_confirm() {
  printf "\\n\\e[0;36mExecute:\\e[1;37m \`$@\`\\n"
  read -r "response?Are you sure? [y/n]: "

  if [[ ${response} =~ ^y ]]; then
    export __execute_with_confirm_executed="1"
    eval "$@"
  else
    export __execute_with_confirm_executed=""
    echo "Canceled."
  fi
}
