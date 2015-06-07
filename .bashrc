# .bashrc

if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PS1='[\u@\h \w]\n$ '
export EDITOR=vim
alias diff="diff -u"
