BRANCH_NAME=""
DEPENDENCIES=()

prune () {
  git checkout main
  bash ../utils/git/prune.sh
}

pull_and_checkout () {
  git checkout main
  git pull

  git checkout -b "$BRANCH_NAME"
}

upgrade_dependencies () {
  yarn

  for dependency in ${DEPENDENCIES[*]}
  do
    echo "Upgrading $dependency"
    if grep -R "$dependency" "package.json"
    then
      yarn upgrade $dependency --latest
    fi
  done
}

open_code () {
  code .
}


main () {
  prune
  pull_and_checkout
  open_code
  upgrade_dependencies
}

main
