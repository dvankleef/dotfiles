# When gisting a file. make it private by default and copy to clipboard
alias gist "gist -c --private"

# Easy accessible vim
alias vi vim

# Commandline shortcuts
alias l ls
alias c clear

# Git aliasses
alias gc "git commit"
alias gs "git status"
alias gl "git log"
alias gd "git diff"
alias ga "git add"
alias gp "git push"
#alias gca "git add -A && git commit"

# JIRASH
alias jirash "~/dev/jirash/bin/jirash"

# Necessary stuff for Go
set -x GOPATH $HOME/go

# Alias to quickly reload fish 
alias refish "source ~/.config/fish/config.fish"

# Git add all, commit, and prompt for commit message
# Usage:
# gac
# .. type your shitty commit message
# <enter>
function gac
    read -l -p git_commit_message message
    git add .
    git commit -m $message
    return 0
end

function git_commit_message
    echo 'Enter your git commit message:'
    echo ''
end
