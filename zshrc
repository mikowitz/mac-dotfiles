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
plugins=(git osx ruby rails rvm autojump)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

set -o vi

export TERM=xterm-256color

export GOPATH="$HOME/go"

#export ANDROID_HOME="/Applications/adt-bundle-mac/sdk"
#PATH="$PATH:$ANDROID_HOME:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
export JAVA_HOME="/usr/libexec/java_home"

export PATH="./bin:/usr/local/bin:$PATH:/Applications/Lilypond.app/Contents/Resources/bin:/usr/local/texlive/2015/bin/universal-darwin"
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
export PATH="$HOME/Code/toolbox:$PATH"
export PATH="/Applications/miniAudicle.app/Contents/Resources:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

export PGHOST=localhost

export EDITOR='vim'
alias gpr='git pull --rebase'
alias gpoh='git push origin HEAD'
alias gpof='git push origin HEAD -f'
alias gg='git grep -n $1'
alias bake='bundle exec rake $1'
alias e="open . -a /Applications/Emacs.app"

alias device_list="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/simctl list"

alias restart='touch ~/.pow/restart.txt && touch tmp/restart.txt'

alias cwip='RAILS_ENV=cucumber rake cucumber:wip'

alias binstall='bundle install --binstubs'

alias gitx='open . -a GitX.app'

bindkey '^R' history-incremental-search-backward

pond() { lilypond $1.ly && open $1.pdf; }
2pdf() { texi2pdf $1.tex && open $1.pdf -a Preview; }
mf2pdf() { mf $1.mf && gftodvi $1.2602gf && dvipdf $1.dvi && open $1.pdf; }
notify() { $@ && terminal-notifier -title "Terminal" -message "$1 finished!"; }
alias love="/Applications/love.app/Contents/MacOS/love"

newrails() { rails new $1 -T -dpostgresql --skip-bundle }

alias poetry='cd ~/Dropbox/poetry && tmux'

alias tas='tmux attach-session -t$1'
alias tks='tmux kill-session -t$1'

# npm
export PATH="$PATH:/usr/local/share/npm/bin"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"

export MAILGUN_API_KEY=key-96c7f844622b6e41c54ef9094d7afc62
export MAILGUN_DOMAIN=https://api.mailgun.net/v3/mg.laurenhallwriting.com

export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export SECRET_TOKEN="thisismysuperlongsecrettokenfordevelopmentitalsohas50m3numb3r5"

. /Users/mberkowitz/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true


# added by travis gem
# [ -f /Users/michaelberkowitz/.travis/travis.sh ] && source /Users/michaelberkowitz/.travis/travis.sh

export NVM_DIR="/Users/michaelberkowitz/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
