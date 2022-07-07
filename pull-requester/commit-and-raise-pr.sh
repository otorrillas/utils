BRANCH_NAME=""
COMMIT_MSG=""
PR_BODY=""

commit_and_push () {
  git add -A
  git commit -m "$COMMIT_MSG"

  git push -u origin $BRANCH_NAME
}

raise_pr () {
  gh pr create --title "$COMMIT_MSG" --body "$PR_BODY"
}

main () {
  commit_and_push
  raise_pr
}

main