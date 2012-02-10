# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby rails rvm vi-mode autojump)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#setopt auto_cd
#cdpath=($HOME/projects $HOME/src/plm-website)

export PATH="./bin:/usr/local/bin:$PATH:/Applications/Lilypond.app/Contents/Resources/bin"

alias gpr='git pull --rebase'
alias gpoh='git push origin HEAD'
alias gg='git grep -n $1'
alias bake='bundle exec rake $1'

alias cwip='RAILS_ENV=cucumber rake cucumber:wip'

alias binstall='bundle install --binstubs'

alias gitx='open . -a GitX.app'

pond() { lilypond $1.ly && open $1.pdf; }

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
