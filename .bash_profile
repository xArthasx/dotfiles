export PATH=/usr/local/Cellar/vim/7.4.1016/bin/:/usr/local/php5/bin:$PATH
alias ls="ls -alGh"
alias stree="open -a sourcetree"
alias op="open "
alias sshpeer="ssh -i ~/Downloads/vpc-selenv.pem ec2-user@54.152.181.3"

livh(){
  livestreamer $1 high
}
alias liv=livh 
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
