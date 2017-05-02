#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
 autoload -Uz promptinit
  promptinit
  prompt zefram

# Customize to your needs...
alias g="git "
alias m="mzsh "
alias mstat="mzsh status"
alias mrun="mzsh startup "
alias vi ="/usr/local/bin/vi"
alias vim ="/usr/local/bin/vim"
dps (){
jps | grep -e "PicoStart" -e "CodeServerMain"|cut -f 1 -d ' ' | xargs  -I % ps -o pid=,command=, % | grep -o  -e "^[0-9]* "  -e "pico.configname=[^ ]* " | xargs -n 2 -I % echo %
#set val = `jps | grep -e "PicoStart" -e "CodeServerMain"|cut -f 1 -d ' ' | xargs  -I % ps -o pid=,command=, % | grep -o  -e "^[1-9]* "  -e "pico.configname=[^ ]* " `
#echo $val
}
dinit(){
cd mediationzone
./env.sh
}
dclean(){
currentDirectory=`pwd`
cd $MZ_HOME
rm -rf data tmp pico-cache storage
mkdir tmp
cd $currentDirectory
}

##Append
##zle vi mode
## Updates editor information when the keymap changes.
# function zle-keymap-select() {
#   zle reset-prompt
#   zle -R
#}
#
## Ensure that the prompt is redrawn when the terminal size changes.
#TRAPWINCH() {
#   zle && { zle reset-prompt; zle -R }
#}
#
#zle -N zle-keymap-select
#zle -N edit-command-line
#
#bindkey -v
## allow v to edit the command line (standard behaviour)
#autoload -Uz edit-command-line
#bindkey -M vicmd 'v' edit-command-line
#
#bindkey '^[[3~' delete-char
#bindkey '^[OH' vi-beginning-of-line
#bindkey '^[OF' vi-end-of-line
##bindkey '^[[3~' backward-delete-word #ctrl + delete
#bindkey '^r' history-incremental-search-backward
#bindkey '^[b' vi-backward-word
#bindkey '^[f' vi-forward-word
#
## if mode indicator wasn't setup by theme, define default
#if [[ "$MODE_INDICATOR" == "" ]]; then
#   MODE_INDICATOR="%{$fg_bold[red]%}ESC%{$reset_color%}"
#fi
#
#function vi_mode_prompt_info() {
#     echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
#}
#
## define right prompt, if it wasn't defined by a theme
#if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
#    RPS1='$(vi_mode_prompt_info)'
#fi

#Check if some-one already set the value for JAVA_HOME variable
if [ -z "$JAVA_HOME" ]; then 
	export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home"
else
	#Nothing..SomeOne already set the value for the variable JAVA_HOME;
fi
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home"
export GOPATH=~/Desktop/Development/Go
PATH=$JAVA_HOME/bin:/usr/local/opt/go/libexec/bin:$GOPATH/bin:$PATH

export DEFAULT_USER="pushparaj"
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

##Exporting path is final statement.Whatever you want to add to the path should be done before this.
export PATH
export LIBNDBPATH="/Users/pushparaj.motamari/Desktop/ubuntu/github/mysql-cluster-gpl-7.4.11-osx10.11-x86_64/lib"
export DYLD_LIBRARY_PATH="/usr/lib;/Users/pushparaj.motamari/Desktop/ubuntu/github/mysql-cluster-gpl-7.4.11-osx10.11-x86_64/lib"
