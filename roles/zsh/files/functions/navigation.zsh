export CURRENT_PROJECT_PATH="${HOME}"/projects

cdpath=("${HOME}"/projects/veracity "${HOME}"/projects/veracity/hudsucker "${HOME}"/projects/veracity/cerebellum-builds "${HOME}"/projects/veracity/juris "${HOME}"/projects/veracity/ham "${HOME}"/projects/veracity/jenkins-pipeline-shared "${HOME}"/projects/veracity/basil "${HOME}"/projects/veracity/Presentation "${ZSH}")

cd_to_most_recently_opened_directory() {
  if [[ -f ${CURRENT_PROJECT_PATH} && -d "$(cat "${CURRENT_PROJECT_PATH}")" ]]; then
    cd "$(cat "${CURRENT_PROJECT_PATH}")"
  fi
}
