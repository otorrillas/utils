REPOS=()

source commit-and-raise-pr.sh
source create-branch-and-upgrade.sh


for repo in ${REPOS[*]}
do
  echo ------------
  echo Repo: $repo
  echo ------------

  git clone "https://github.com/$repo.git"
  cd $repo


  prune

  pull_and_checkout
  upgrade_dependencies
  commit_and_push
  raise_pr
  
  cd ..
done
