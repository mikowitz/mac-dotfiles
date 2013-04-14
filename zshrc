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

export PATH="./bin:/usr/local/bin:$PATH:/Applications/Lilypond.app/Contents/Resources/bin:/usr/texbin"
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
export PATH="/Users/mikowitz/projects/toolbox:$PATH"

export EDITOR='vim'
alias gpr='git pull --rebase'
alias gpoh='git push origin HEAD'
alias gpof='git push origin HEAD -f'
alias gg='git grep -n $1'
alias bake='bundle exec rake $1'

alias restart='touch ~/.pow/restart.txt && touch tmp/restart.txt'

alias cwip='RAILS_ENV=cucumber rake cucumber:wip'

alias binstall='bundle install --binstubs'

alias gitx='open . -a GitX.app'

bindkey '^R' history-incremental-search-backward

pond() { lilypond $1.ly && open $1.pdf; }
2pdf() { texi2pdf $1.tex && open $1.pdf -a Preview; }
mf2pdf() { mf $1.mf && gftodvi $1.2602gf && dvipdf $1.dvi && open $1.pdf; }
alias love="/Applications/love.app/Contents/MacOS/love"

newrails() { rails new $1 -T -dpostgresql --skip-bundle }

alias poetry='cd ~/Dropbox/poetry'

alias tas='tmux attach-session -t$1'
alias tks='tmux kill-session -t$1'

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"


export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
