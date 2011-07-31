function __populate_git_ps1_vars () {
	# this relies on a bashism, so make sure you're actually using bash.
	# specifically it relies on <<<"word".
	local status
	local prompt="$(__git_ps1 "%s")"
	# empty out the vars
	__git_ps1_branch=""
	__git_ps1_staged=""
	__git_ps1_unstaged=""
	__git_ps1_stash=""
	__git_ps1_untracked=""
	__git_ps1_upstream=""
	__git_ps1_left=""
	__git_ps1_right=""
	if test -z "$prompt"; then
		# return now
		return
	fi
	__git_ps1_left=" ("
	__git_ps1_right=")"
	__git_ps1_branch="$(git rev-parse --symbolic-full-name --abbrev-ref=loose HEAD)"
	status="${prompt#$__git_ps1_branch}"
	while read -N 1 char; do
		case "$char" in
			\*) __git_ps1_unstaged="$char" ;;
			+) __git_ps1_staged="$char" ;;
			$) __git_ps1_stash="$char" ;;
			%) __git_ps1_untracked="$char" ;;
			\<|\>) __git_ps1_upstream="${__git_ps1_upstream}$char" ;;
		esac
	done <<<"$status"
}

# PROMPT_COMMAND=__populate_git_ps1_vars

# PS1='\w${__git_ps1_left}${__git_ps1_branch}\[\e[31m\]${__git_ps1_staged}\[\e[34m\]${__git_ps1_unstaged}\[\e[32m\]${__git_ps1_stash}\[\e[1;34m\]${__git_ps1_untracked}\[\e[31m\]${__git_ps1_upstream}\[\e[m\]${__git_ps1_right} > '

        BLACK="\[\e[30m]"
  LIGHT_BLACK="\[\e[90m\]"
          RED="\[\e[31m\]"
    LIGHT_RED="\[\e[91m\]"
        GREEN="\[\e[32m\]"
  LIGHT_GREEN="\[\e[92m\]"
       YELLOW="\[\e[33m\]"
 LIGHT_YELLOW="\[\e[93m\]"
         BLUE="\[\e[34m\]"
   LIGHT_BLUE="\[\e[94m\]"
      MAGENTA="\[\e[35m\]"
LIGHT_MAGENTA="\[\e[95m\]"
         CYAN="\[\e[36m\]"
   LIGHT_CYAN="\[\e[96m\]"
        WHITE="\[\e[37m\]"
  LIGHT_WHITE="\[\e[97m\]"
   COLOR_NONE="\[\e[0m\]"


function prompt_func() {
	previous_return_value=$?;

	GIT_PS1_SHOWDIRTYSTATE=1
	GIT_PS1_SHOWSTASHSTATE=1
	GIT_PS1_SHOWUNTRACKEDFILES=1
	git_prompt="$(__git_ps1 " (${GREEN}%s${COLOR_NONE})")"
	# prompt="${TITLEBAR}$BLUE[$RED\w$GREEN$(__git_ps1)$YELLOW$(git_dirty_flag)$BLUE]$COLOR_NONE "
	prompt="\h:${LIGHT_BLUE}\W${COLOR_NONE}${git_prompt}"
	# prompt="${BLUE}\w${COLOR_NONE}${git_prompt}"

	if test $previous_return_value -eq 0; then
		PS1="${prompt} \$ ${COLOR_NONE}"
	else
		PS1="${prompt}${RED} \$ ${COLOR_NONE}"
	fi
}

PROMPT_COMMAND="prompt_func; $PROMPT_COMMAND"


