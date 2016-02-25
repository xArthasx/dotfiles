export PATH=/usr/local/Cellar/vim/7.4.1016/bin/:/usr/local/php5/bin:$PATH
if [ -d "/Users/xArthasx/Library/Android/sdk/platform-tools" ]; then
    export PATH=/Users/xArthasx/Library/Android/sdk/platform-tools:$PATH
fi
if [ ! -z "/Applications/Emacs.app" ]; then
    alias emacs="emacs -nw"
fi
export EDITOR=vim
alias ls="ls -alGh"
alias stree="open -a sourcetree"
alias op="open "
alias sshpeer="ssh -i ~/Downloads/vpc-selenv.pem ec2-user@54.152.181.3"

livh(){
  livestreamer $1 high
}
alias liv=livh
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

if [ ! -z $(command -v rbenv) ]; then
    eval "$(rbenv init -)"
fi
