set -gx TERM "screen-256color"
set -Ux LSCOLORS Gxfxcxdxbxegedabagacad

set -gx DATABASE_USER mberkowitz

set PATH $HOME/.local/bin $PATH
set PATH /usr/local/Cellar $PATH
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
set PATH /Applications/Postgres.app/Contents/Versions/9.4/bin $PATH
set PATH /Applications/Lilypond.app/Contents/Resources/bin $PATH
rbenv rehash >/dev/null ^&1

set PSQL_EDITOR /usr/local/bin/vim

alias e "vim ."
alias g "git"
alias gpoh "git push origin HEAD"
alias gpof "git push origin HEAD --force"
alias bake "bundle exec rake"

function tas
  tmux attach-session -t $argv
end

function tks
  tmux kill-session -t $argv
end

function pond
  lilypond $argv.ly; and open $argv.pdf
end

function 2pdf
  texi2pdf $argv.tex; and open $argv.pdf
end

eval (direnv hook fish)
source ~/.ez.fish
source ~/.aws.fish
source ~/.git.fish

bass export NVM_DIR="$HOME/.nvm"
bass [ -s "$NVM_DIR/nvm.sh" ] '&&' . "$NVM_DIR/nvm.sh" # This loads nvm
