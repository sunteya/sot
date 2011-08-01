function __populate_git_ps1_vars () {
	# this relies on a bashism, so make sure you're actually using bash.
	# specifically it relies on <<<"word".
	local status
	
	__git_ps1_prompt=""
	__git_ps1_branch=""
	__git_ps1_status=""
	
	__git_ps1_staged=""
	__git_ps1_unstaged=""
	__git_ps1_stash=""
	__git_ps1_untracked=""
	__git_ps1_upstream=""
	
	GIT_PS1_SHOWDIRTYSTATE=1
	GIT_PS1_SHOWSTASHSTATE=1
	GIT_PS1_SHOWUNTRACKEDFILES=1
	local prompt="$(__git_ps1 "%s")"
	if test -z "$prompt"; then
		return
	fi
	
	__git_ps1_prompt=$prompt
	__git_ps1_branch="$(git rev-parse --symbolic-full-name --abbrev-ref=loose HEAD)"
	__git_ps1_status=$(echo "${__git_ps1_prompt#$__git_ps1_branch}" | sed 's/^[ ]//g')
	
	local str="$__git_ps1_status"
	local cnt=${#str}
	for ((i=0; i < cnt; i++)); do
		local char="${str:$i:1}"
		case "$char" in
			\*) __git_ps1_unstaged="$char" ;;
			+) __git_ps1_staged="$char" ;;
			$) __git_ps1_stash="$char" ;;
			%) __git_ps1_untracked="$char" ;;
			\<|\>) __git_ps1_upstream="${__git_ps1_upstream}$char" ;;
		esac
	done
}

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
	
	__populate_git_ps1_vars;
	
	git_prompt=""
	if [[ -n "${__git_ps1_branch}" ]]; then
		# echo "__git_ps1_branch: ${__git_ps1_branch}"
		# echo "===================="
		# echo "${__git_ps1_staged}"
		# echo "${__git_ps1_unstaged}"
		# echo "${__git_ps1_stash}"
		# echo "${__git_ps1_untracked}"
		# echo "${__git_ps1_upstream}"
		# echo "===================="
		
		git_status_color=""
		
		if [[ -n "${__git_ps1_staged}" ]]; then
			git_status_color=$YELLOW
		fi
		if [[ -n "${__git_ps1_untracked}" ]]; then
			git_status_color=$RED
		fi
		if [[ -n "${__git_ps1_unstaged}" ]]; then
			git_status_color=$RED
		fi
		
		git_prompt="(${git_status_color}${__git_ps1_prompt}${COLOR_NONE})"
	fi
	
	
	# prompt="${TITLEBAR}$BLUE[$RED\w$GREEN$(__git_ps1)$YELLOW$(git_dirty_flag)$BLUE]$COLOR_NONE "
	prompt="\h:${LIGHT_BLUE}\W${COLOR_NONE}${git_prompt}"
	# prompt="${BLUE}\w${COLOR_NONE}${git_prompt}"
	
	if [[ $(id -u) == 0 ]]; then
		user_prompt="#"
	else
		user_prompt="$"
	fi
	
	if test $previous_return_value -eq 0; then
		PS1="${prompt} ${user_prompt} ${COLOR_NONE}"
	else
		PS1="${prompt}${RED} ${user_prompt} ${COLOR_NONE}"
	fi
}

PROMPT_COMMAND="prompt_func; $PROMPT_COMMAND"


