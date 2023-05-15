#
# ~/.bashrc
#

export MANPAGER="vim -M +MANPAGER -"

function vol(){
 if [[ $# = 0 ]]; then
 return;
 fi 
 pactl -- set-sink-volume 0 "$1%"
}


alias e='echo e'
alias ls='ls --color=auto'
alias grep='grep --color=auto'



export PS1="\[\033[34m\]\[\033[1m\]\w\[\033[32m\]>\[\033[0m\] "


function code()   {
   if [[ $# = 0 ]] ; then
   cd ~/code/
   return
   fi
   cd ~/code/$1
}

function home(){
cd ~
}


