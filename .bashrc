#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


############################
## Set up the bash prompt ##
############################

# Colours
C_NO='\[\033[00m\]'
C_BLACK='\[\033[30m\]'
C_BLUE='\[\033[34m\]'
C_CYAN='\[\033[36m\]'
C_GREEN='\[\033[32m\]'
C_PURPLE='\[\033[35m\]'
C_RED='\[\033[31m\]'
C_WHITE='\[\033[37m\]'
C_YELLOW='\[\033[33m\]'
BG_BLACK='\[\033[40m\]'

# git
GIT_PROMPT_FILE=/usr/share/git/completion/git-prompt.sh
if [[ -f "$GIT_PROMPT_FILE" ]]; then
	source "$GIT_PROMPT_FILE"
	PROMPT_GIT="$C_PURPLE"'$(__git_ps1)'"$C_NO"
fi

# finally, set the prompt
PS1="$BG_BLACK[$C_BLUE\u$C_NO$BG_BLACK:$C_GREEN\w$PROMPT_GIT$BG_BLACK]$C_GREEN\$$C_NO "


################
## Completion ##
################
complete -c man which
complete -cf sudo

GIT_COMPLETIONS=/usr/share/bash-completion/completions/git
[[ -f "$GIT_COMPLETIONS" ]] && source "$GIT_COMPLETIONS"


#############
## Various ##
#############

# Shorten bash history by not logging duplicates
export HISTCONTROL=ignoredups

alias ls='ls --color=auto'
