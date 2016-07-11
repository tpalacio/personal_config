# .bash_profile

alias vi=emacs
alias vsql='vsql -h vertica.analytics.renttherunway.it -U tpalacio'
# alias vsql='vsql -h vertica.analytics.renttherunway.it -U tpalacio -w Living4Data'
alias vsqld='vsql -h vertica.analytics.renttherunway.it -U dbadmin'
alias vsqle='vsql -h vertica.analytics.renttherunway.it -U etl'
alias mysql5='mysql -hdb5.analytics.renttherunway.com -utpalacio -pLiving4Data -Danalytics -A'
alias mysqldb5='mysql -hdb5.analytics.renttherunway.com -utpalacio -pLiving4Data -Danalytics -A'
alias db5='mysql -hdb5.analytics.renttherunway.com -utpalacio -pLiving4Data -Danalytics -A'
alias db1stage='mysql -hdb01.stage.renttherunway.it -urtr_user -pdev -A'
alias mate="rmate"
alias em='emacs'
alias e='emacs'
alias lisp='cd ~/.emacs.d/lisp'
alias cd..='cd ..'
alias now='date'
alias ssh_s1=''
#alias ssh_mb=`cat /home/tpalacio/ip/Macbook/where.txt | { read test; echo ssh\ -R\ 58585:localhost:58585\ tpalacio@$test; }`
#alias ssh_im=`cat /home/tpalacio/ip/iMac/where.txt | { read test; echo ssh\ -R\ 52600:localhost:52600\ tpalacio@$test; }`
#alias mb=`cat /home/tpalacio/ip/Macbook/where.txt | { read test; echo tpalacio@$test; }`
#alias im=`cat /home/tpalacio/ip/iMac/where.txt | { read test; echo tpalacio@$test; }`

# ls as case-insensitive
shopt -s nocaseglob

function lcp {
  $(ssh echo $SSH_CLIENT | awk {print "tpalacio@" $1} pbcopy)
}

#bigdata edit job
function ej {
  string=$(echo $1 | sed -e 's/\*/\.\*/g') # wild cards require .* instead of *
  if [[ $1 == *.* ]]; then # if arg contains dot then do not append extension
    findstring=".*$string.*"
  else
    findstring=".*$string.*\.(scala|rb).*"
  fi
  findjob=$(find ~/development/BigData/lib/jobs/scalding ~/development/BigData/lib/jobs/cascading -regextype posix-awk -iregex $findstring)
  # if [ ! -z $findjob ]; then # works until you wrap the variable with quotes which guarantees it not to be empty
  if [ ! -z "$findjob" ]; then
    $EDITOR $findjob
  else
    echo "no matching jobs"
  fi
}

#bigdata view operator
function vo {
  string=$(echo $1 | sed -e 's/\*/\.\*/g') # wild cards require .* instead of *
  if [[ $1 == *.* ]]; then # if arg contains dot then do not append extension
    findstring=".*$string.*"
  else
    findstring=".*$string.*\.(scala|rb).*"
  fi
  findoperator=$(find ~/development/BigData/lib/operators/src/main/scala -regextype posix-awk -iregex $findstring)
  findlen=${#findoperator}
  if [ $findlen != 0 ]; then
    $EDITOR $findoperator
  else
    echo "no matching operators"
  fi
}

#bigdata view helper - search for helper within a file, if no match then search file names
function vh {
# set -x
  findhelper=$(grep -lri "def $1" ~/development/BigData/lib/jobs/helpers)
  findstring=".*$1.*\.(scala|rb).*"
  findfile=$(find ~/development/BigData/lib/jobs/helpers -regextype posix-awk -iregex $findstring)
  if [ ! -z $findhelper ]; then
    $EDITOR $findhelper
  elif [ ! -z $findfile ]; then
     $EDITOR $findfile
  else
    echo "No matching helper functions or files"
  fi
}

# -Hrno --max-count=1 # Incorporate this at some point to point the file at the matching line

#bigdata view function (scalding) - search for helper within a file, if no match then search file names
function vf {
  findfunction=$(grep -lri "def $1" ~/development/BigData/lib/operators/src/main/scala)
  findstring=".*$1.*\.(scala|rb).*"
  findfile=$(find ~/development/BigData/lib/operators/src/main/scala -regextype posix-awk -iregex $findstring)
  if [ ! -z $findfunction ]; then
    $EDITOR $findfunction
  elif [ ! -z $findfile ]; then
     $EDITOR $findfile
  else
    echo "No matching functions or files"
  fi
}

# Get the aliases and functions
# if [ -f ~/.bashrc ]; then
# 	. ~/.bashrc
# fi

[[ -s ~/.bashrc ]] && source ~/.bashrc

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:/usr/local/lib

export PATH

# Vertica is defaulting to show LESS when printing results which can't be copied via tmux

# export PAGER=/bin/more 
export PAGER=less
export LESS="-iMSx4 -RX" # removed "-F" because it was killing some custom tmux features (vertica table search, current processes) # removed "-e" which is useful but i trigger it accidentally too often # ---X is important for making sure LESS does not clear screen after it outputs paginated results from things like vertica

HISTSIZE=5000
HISTFILESIZE=5000
HISTCONTROL=ignoredups

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# used for RVM
source ~/.profile
