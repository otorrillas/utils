echo "Renaming '$1' to '$2'"
git branch -m $1 $2
git push origin :$1 $2
git push origin -u $2