# Path to your oh-my-zsh installation.
export ZSH=/Users/pushparaj.motamari/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"
#ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting)

# User configuration
export PATH="usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias m="mzsh "
alias mstat="mzsh status"
alias mrun="mzsh startup "
dps (){
jps | grep -e "PicoStart" -e "CodeServerMain"|cut -f 1 -d ' ' | xargs  -I % ps -o pid=,command=, % | grep -o  -e "^[0-9]* "  -e "pico.configname=[^ ]* " | xargs -n 2 -I % echo %
#set val = `jps | grep -e "PicoStart" -e "CodeServerMain"|cut -f 1 -d ' ' | xargs  -I % ps -o pid=,command=, % | grep -o  -e "^[1-9]* "  -e "pico.configname=[^ ]* " `
#echo $val
}
#env.sh
. ~/.zsh_config/env.sh

#Append
#zle vi mode
# Updates editor information when the keymap changes.
 function zle-keymap-select() {
   zle reset-prompt
   zle -R
}

# Ensure that the prompt is redrawn when the terminal size changes.
TRAPWINCH() {
   zle && { zle reset-prompt; zle -R }
}

zle -N zle-keymap-select
zle -N edit-command-line

bindkey -v
# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

bindkey '^[[3~' delete-char
bindkey '^[OH' vi-beginning-of-line
bindkey '^[OF' vi-end-of-line
#bindkey '^[[3~' backward-delete-word #ctrl + delete
bindkey '^r' history-incremental-search-backward
bindkey '^[b' vi-backward-word
bindkey '^[f' vi-forward-word

# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
   MODE_INDICATOR="%{$fg_bold[red]%}ESC%{$reset_color%}"
fi

function vi_mode_prompt_info() {
     echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
    RPS1='$(vi_mode_prompt_info)'
fi

#Check if some-one already set the value for JAVA_HOME variable
if [ -z "$JAVA_HOME" ]; then 
	export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home"
else
	#Nothing..SomeOne already set the value for the variable JAVA_HOME;
fi
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home"
export GOPATH=~/Desktop/Development/Go
export PATH=$JAVA_HOME/bin:/usr/local/opt/go/libexec/bin:$GOPATH/bin:$PATH

export DEFAULT_USER="pushparaj"
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
