# Disable right prompt
function fish_right_prompt
end

# Cleanup prompt color
set -e fish_pager_color_progress

[ -r ~/.localrc.fish ]; and source ~/.localrc.fish
