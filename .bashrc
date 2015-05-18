# .bashrc

if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

#for file in /etc/bash_completion.d/* ; do
#	source "$file"
#done

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PS1='[\u@\h \w]\n$ '
export EDITOR=vim
#export PATH="$HOME/.cabal/bin:$PATH"
#alias g++="g++ -std=c++11"
#alias gcc="gcc -std=c11"
alias diff="diff -u"


PATH="/home/alexandru/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/alexandru/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/alexandru/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/alexandru/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/alexandru/perl5"; export PERL_MM_OPT;
