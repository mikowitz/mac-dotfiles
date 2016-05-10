set -gx TERM "screen-256color"
set -Ux LSCOLORS Gxfxcxdxbxegedabagacad

set -gx DATABASE_USER mberkowitz

set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
set PATH /Applications/Postgres.app/Contents/Versions/9.4/bin $PATH
set PATH /Applications/Lilypond.app/Contents/Resources/bin $PATH
rbenv rehash >/dev/null ^&1

alias e "open . -a Emacs.app"
alias g "git"
alias gpoh "git push origin HEAD"
alias gpof "git push origin HEAD --force"
alias bake "bundle exec rake"

function pond
  lilypond $argv.ly; and open $argv.pdf
end

function 2pdf
  texi2pdf $argv.tex; and open $argv.pdf
end

eval (direnv hook fish)
source ~/.ez.fish
