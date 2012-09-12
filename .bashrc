
set -o vi

# ALIASES
alias ll='ls -l'
alias la='ls -a'
alias pf='printf "%-20s"'

alias medusa1='ssh medusa001.989studios.com'
alias medusa2='ssh medusa002.989studios.com'
alias medusa4='ssh medusa004.989studios.com'
alias rwlinux='ssh sd-rwiley-linux.989studios.com'
alias rwwl='ssh sd-rwiley-linux.989studios.com rw.worklog'
alias psef='ps -Al'
alias psl='ps -o user,pid,ppid,%cpu,%mem,lstart,command'
alias pso='ps -o user,pid,ppid,pgid,sess,lstart,command ; date'

. ~/git-prompt.sh
. ~/git-completion.bash

alias gl1='git log --pretty=format:"  %h  %s"'
alias gl2='git log --pretty=format:"  %h  %an %ar - %s"'
alias gl3='git log --pretty=oneline'
alias gl4='git log --pretty=format:"  %h  %an %aD - %s"'
alias glg='git log --graph --oneline --all'
alias glgg="git log --graph --pretty=format:'%Cred%h%Creset - %Cgreen%ad -%C(bold yellow)%d%Creset %s %C(bold blue)<%an>%Creset' --abbrev-commit --date=short"
alias gb='git branch'
alias gbv='git branch -av'
alias gs='git status'
alias gl='glgg'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gct='git checkout --track'
alias gd='git diff'
alias gp='git pull'
alias gf='git fetch'

export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$PATH:.
export MANPATH=/opt/local/share/man:$MANPATH
export DYLD_LIBRARY_PATH=/usr/lib:/usr/local/lib:/usr/local/mysql/lib

if [[ -s /Users/rwiley/.rvm/scripts/rvm ]] ; then source /Users/rwiley/.rvm/scripts/rvm ; fi

glog () 
{ 
    for h in `git branch |sed -e 's/\*//' |grep -v master`;
    do
        echo $h;
        git log --pretty=format:"  %h  %an %ar - %s" -10 $h;
    done;
    echo;
    echo ========================;
    git branch -av
}

[ "`uname`" == "Darwin" ] && alias ldd='otool -L'

green_text() {
  echo -n "[32;40m$@[0;37;40m"
}

red_text() {
  echo -n "[31;40m$@[0;37;40m"
}

export PS1='\t \u@\h \W$(__git_ps1 " ($(green_text %s))") $ '
