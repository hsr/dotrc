export PS1='\[\033[00;37m\]\u \[\033[01;34m\]\W \[\033[00;32m\]#\#\[\033[01;34m\] \$\[\033[00m\] '
export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias more=less;
alias cls=clear;
alias c=clear;
alias mkdri=mkdir;
alias l=ls;
alias ll='ls -l';
alias la='ls -a';

function calc {
	echo $* | bc -l;
}

function findtoken {
	for i in $(find . -type d -and -not -path '*.svn*' ); do
		grep -n --color -E "${1}" ${i}/*;
	done 2> /dev/null;
}

function ssh-agent-start {
	unset SSH_AGENT_PID
	unset SSH_AUTH_SOCK
	if [ ! -e "/tmp/ssh-agent.pid" ]; then
		/usr/bin/ssh-agent -s | head -n2 > /tmp/ssh-agent.pid;
	elif [ -z "$(. /tmp/ssh-agent.pid; ps ${SSH_AGENT_PID} | grep agent)" ]; then
		/usr/bin/ssh-agent -s | head -n2 > /tmp/ssh-agent.pid;
	fi
	. /tmp/ssh-agent.pid;
	
	
	if [ -z "$(ssh-add -l | grep '/Users/hsr/.ssh/id_rsa')" ]; then
		ssh-add /Users/hsr/.ssh/id_rsa;
		#echo "Identity added!"
	fi
}

#ssh-agent-start

function diffl () {
    if [ ! -e $1 ] || [ ! -e $2 ]; then
        echo 0;
    fi
    diff $1 $2 | wc -l
}

export EDITOR=vim
