### Coloring git/svn branchs
parse_git_branch () {
  #git name-rev HEAD 2> /dev/null | sed 's#HEAD\ (.*)# (git::\1)#'
  branch=`__git_ps1`
  [ ! -z "$branch" ] && echo "$branch"
}
parse_svn_branch() {
  #parse_svn_url | sed -e "s#^$(parse_svn_repository_root)##g" | awk '{print " (svn::"$1")" }'
  branch=`svn info 2>/dev/null | sed -ne 's#^Relative URL: ^##p'`
  [ ! -z "$branch" ] && echo " ($branch)"
}
#parse_svn_url() {
#  svn info 2>/dev/null | sed -ne 's#^URL: ##p'
#}
#parse_svn_repository_root() {
#  svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
#}

BLACK="\033[0;38m"
RED='\033[0;31m'
#RED_BOLD="\033[01;31m"
#BLUE="\033[01;34m"
#GREEN="\033[0;32m"

export PS1="${PS1::-3}$RED\$(parse_git_branch)\$(parse_svn_branch)$BLACK$ "
