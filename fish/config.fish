# Disable right prompt
function fish_right_prompt
end

# Cleanup prompt color
set -e fish_pager_color_progress

# Export all ~/.profile environments
env -i HOME=$HOME LC_CTYPE=$LC_CTYPE LANG=$LANG bash -l -c printenv | \
  grep -v -E "^(HOME|PWD|SHLVL|_)="  | \
  sed -e 's/=/="/;s/$/"/;s/^/export /' | \
  source

[ -r ~/.localrc.fish ]; and source ~/.localrc.fish
