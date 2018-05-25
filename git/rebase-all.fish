set branches feature/sprint5/OS-27-help-icon feature/sprint4/OS-54-legal-terms

git fetch

for branch in $branches
  git checkout $branch
  git rebase origin/master
  git push origin +$branch
end