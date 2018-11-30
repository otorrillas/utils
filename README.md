# utils

Utils that help my everyday life

## git

Some git utilities:

- `interactive-drop`: cleanup for `git stash` - drops all stashes in a range (e.g. from `5` to `10`).
- `prune`: removes already merged branches and remotely removed branches
- `rebase-all`: rebases all defined branches in line `#1` against `master`
- `rename`: renames a branch from `$1` to `$2` argument (including remotely)

## codemods

`jscodeshift` codemods to help with migrations and code refactors:

- `relativePaths`: remove relative paths for specified aliases
