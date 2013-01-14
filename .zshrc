# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jaffee"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/sbin:/usr/sbin:/usr/local/panda/bin:/home/jaffee/gradle/gradle-1.2/bin
export LD_LIBRARY_PATH=/usr/local/share/panda/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$PYTHONPATH:/usr/local/share/panda/lib

setxkbmap -option ctrl:nocaps

export HISTSIZE=40000000
export SAVEHIST=40000000
setopt INC_APPEND_HISTORY
unsetopt SHARE_HISTORY
ub-package () { tar zc ${1} | cat ${1}/ubuntu-install.sh - > ${1}.sh;} 
fed-package () { tar zc ${1} | cat ${1}/fedora-install.sh - > ${1}.sh;}
dispe () { disper -d DFP-4,CRT-0 -e -t right }
setopt nocorrectall
unsetopt CORRECT
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
xset b off
xset r rate 210 33
export SCINET_ROOT=/home/jaffee/repos/scinet-it
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}