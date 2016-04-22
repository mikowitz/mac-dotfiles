set -gx TERM "screen-256color"
set -Ux LSCOLORS Gxfxcxdxbxegedabagacad

set -gx DATABASE_USER mberkowitz

set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

alias g "git"
alias v "vim"
alias gpoh "git push origin HEAD"
alias gpof "git push origin HEAD --force"
alias bake "bundle exec rake"
