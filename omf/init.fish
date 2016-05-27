set fish_greeting

# Disable right prompt
function fish_right_prompt
end

# Export all ~/.profile environments
env -i HOME=$HOME bash -l -c printenv | \
  grep -v -E "^(HOME|PWD|SHLVL|_)="  | \
  sed -e '/PATH/s/:/ /g;s/=/ /;s/^/set -x /' | \
  source

[ -r ~/.localrc.fish ]; and source ~/.localrc.fish
