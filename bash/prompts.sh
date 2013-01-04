function __populate_git_ps1_vars () {
	if ! $(type __git_ps1 >/dev/null 2>&1); then
		return
	fi
	
	unset GIT_PS1_SHOWDIRTYSTATE
	unset GIT_PS1_SHOWSTASHSTATE
	unset GIT_PS1_SHOWUNTRACKEDFILES
	unset GIT_PS1_SHOWUPSTREAM
	__git_ps1_prompt="$(__git_ps1 "%s")"
	if test -z "${__git_ps1_prompt}"; then
		return
	fi
	
	
	__git_ps1_dirty_state=""
	__git_ps1_stash_state=""
	__git_ps1_untracked_state=""
	__git_ps1_upstream_state=""
	if [ "true" = "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
		git diff --no-ext-diff --quiet --exit-code || __git_ps1_dirty_state="*"
		if git rev-parse --quiet --verify HEAD >/dev/null; then
			git diff-index --cached --quiet HEAD -- || __git_ps1_dirty_state="+"
		else
			__git_ps1_dirty_state="#"
		fi
		
		git rev-parse --verify refs/stash >/dev/null 2>&1 && __git_ps1_stash_state="$"
		
		if [ -n "$(git ls-files --others --exclude-standard)" ]; then
			__git_ps1_untracked_state="%"
		fi
		
		__git_ps1_show_upstream 2> /dev/null
		if [[ "=" != "${p}" ]]; then
			__git_ps1_upstream_state="$p"
		fi
		unset p
	fi
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
	if [[ -n "${__git_ps1_prompt}" ]]; then
		git_prompt_color=$GREEN
		git_status=""
		
		if [[ -n "${__git_ps1_upstream_state}" ]]; then
			git_prompt_color=$YELLOW
			git_status="${git_status}${__git_ps1_upstream_state}"
		fi
		
		if [[ -n "${__git_ps1_stash_state}" ]]; then
			git_status="${git_status}${__git_ps1_stash_state}"
		fi
		
		if [[ -n "${__git_ps1_dirty_state}" ]]; then
			git_prompt_color=$RED
			git_status="${git_status}${__git_ps1_dirty_state}"
		fi
		if [[ -n "${__git_ps1_untracked_state}" ]]; then
			git_prompt_color=$RED
			git_status="${git_status}${__git_ps1_untracked_state}"
		fi
		
		if [[ -n "${git_status}" ]]; then
			git_status=" ${git_status}"
		fi
		
		git_prompt=" (${git_prompt_color}${__git_ps1_prompt}${COLOR_NONE}${git_status})"
	fi
	
	prompt="${LIGHT_GREEN}\h:${LIGHT_BLUE}\w${COLOR_NONE}${git_prompt}"
	
	
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


