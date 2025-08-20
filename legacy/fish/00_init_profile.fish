# Export all ~/.profile environments
env -i HOME=$HOME LC_CTYPE=$LC_CTYPE LANG=$LANG bash -l -c printenv | \
  grep -v -E "^(HOME|PWD|SHLVL|_)="  | \
  sed -e 's/=/="/;s/$/"/;s/^/export /' | \
  source

