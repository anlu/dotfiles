autoload -Uz compinit
compinit
zmodload -a complist
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-compctl false
__git_files () {
   _wanted files expl 'local files' _files
}

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=25000

setopt no_beep
setopt extendedglob
setopt prompt_subst
setopt complete_in_word
setopt no_auto_menu
setopt hist_ignore_dups
setopt hist_ignore_space
setopt extended_history

autoload -U edit-command-line
zle -N edit-command-line
bindkey -e
bindkey '\C-v' edit-command-line
bindkey '^b' backward-word
bindkey '^f' forward-word

# Make it so forward/backward-word also stops on '/' characters
local WORDCHARS=${WORDCHARS//\//}

autoload colors
colors
export PS1="%{%B%F{green}%}%n%{%B%F{blue}%}@%{%B%F{cyan}%}%m%{%B%F{green}%} %{%b%F{yellow}%}%~%{%B%F{green}%} \$ "

# exit status
RPROMPT="%(?..%{$fg_bold[red]%}%? %{$reset_color%})"
# suspended jobs
RPROMPT+="%1(j.%{$fg[green]%}%j .)"
# git branch
autoload -Uz vcs_info
zstyle ':vcs_info:*' unstagedstr "%{$fg[red]%}*"
zstyle ':vcs_info:*' stagedstr "%{$fg[red]%}+"
zstyle ':vcs_info:*' formats "$bright_cyan%b%u%c"
zstyle ':vcs_info:*' actionformats "$bright_cyan%b%u%c|%a"
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b:%r'
zstyle ':vcs_info:bzr:*' use-simple true
zstyle ':vcs_info:*' enable git hg bzr svn cvs
precmd () { vcs_info }
RPROMPT+='${vcs_info_msg_0_}'
RPROMPT+="%{$reset_color%}"

export EDITOR=vim
export MANPAGER="/bin/sh -c \"col -bx | vim -c 'set ft=man' -\""
export GREP_COLORS='ms=01;36:mc=01;31:sl=:cx=:fn=35:ln=33:bn=33:se=01;34'

alias ls='ls --color'
alias ll='ls -l'
alias l.='ls -Ad .*'
alias la='ls -A'
alias df='df -hx tmpfs'
alias du='du --max-depth=1'
alias sr='screen -d -r'
alias vim='nvim'
alias sudovim='sudo nvim -N -u /home/anlu/.vimrc'
function cl() {
	if [ $# = 0 ]; then
		cd && ls
	else
		cd "$*" && ls
	fi
}

alias gil='git log --graph --abbrev-commit --stat -C --decorate --patience --date=local'
alias gib='git branch -a'
alias gis='git status'
alias gid='git diff -C --patience --date=local'
alias giw='git show -C --patience --date=local'
alias gic='git checkout'
gcb () {
    match=`git rev-parse --abbrev-ref --branches="*$1*"`
    case `wc -w <<< "$match" | tr -d ' '` in
        ("0") echo "error: '$1' did not match any branch." 2>&1 ;;
        ("1") git checkout $match ;;
        (*) echo "error: '$1' is ambigious among:\n$match" 2>&1 ;;
    esac
}

stty stop undef

if [ -d $HOME/bin ]; then PATH=$HOME/bin:$PATH fi

alias sr='screen -r'
