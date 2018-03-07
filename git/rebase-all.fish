set branches feature/sprint6/OS-122-session-timeout feature/sprint5/OS-47-bmr-smr feature/sprint5/OS-27-help-icon feature/sprint5/OS-1118-Exit-Application feature/sprint4/OS-54-legal-terms

git fetch

for branch in $branches
  git checkout $branch
  git rebase origin/master
  git push origin +$branch
end