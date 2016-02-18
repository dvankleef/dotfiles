# When gisting a file. make it private by default and copy to clipboard
alias gist "gist -c --private"

# Easy accessible vim
alias vi vim

# Commandline shortcuts
alias l ls
alias c clear
alias q exit

alias h peco_select_history

# Git aliasses
alias gc "git commit"
alias gs "git status"
alias gd "git diff"
alias ga "git add"
alias gaa "git add ."
alias gau "git add -u ."
alias gp "git push"
alias gdc "git diff --cached"
alias gpb "pushbranch"
alias grh "git reset HEAD"
alias undo "git checkout ."
alias cb "git checkout"
alias gu "git pull origin master"
alias gac "git add .; gcm"
alias gapc "git add -p .; gcm"
alias lastcommit "git show HEAD"
alias ap "git add --all; git commit --amend --no-edit"
# Git add all, commit and push
#alias gca "git add -A && git commit"

alias gl="clear ;and git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# JIRASH
alias jirash "~/dev/jirash/bin/jirash"

# Config file aliasses
alias fishconfig "vim ~/dev/dotfiles/fish/config.fish"
alias utilconfig "vim ~/dev/dotfiles/fish/utils.fish"
alias promptconfig "vim ~/dev/dotfiles/fish/prompt.fish"
alias vimconfig "vim ~/dev/dotfiles/vim/vimrc"
alias tmuxconfig "vim ~/dev/dotfiles/tmux/tmux.conf"
alias gitconfig "vim ~/dev/dotfiles/git/gitconfig"

# Load the prompt configuration
source ~/dev/dotfiles/fish/prompt.fish

# Load z.fish - A script that helps to autofill to the latest use directory
source ~/dev/dotfiles/fish/z.fish

# Load util scripts 
source ~/dev/dotfiles/fish/utils.fish

# Necessary stuff for Go
set -x GOPATH $HOME/go

# Set the NVM Path
#set -x NVM_DIR "/home/yq63el/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] and source "$NVM_DIR/nvm.sh" # This loads NVM 

set -x NVM_DIR "/home/yq63el/.nvm"
source ~/.config/fish/nvm-wrapper/nvm.fish

function setCapsToCTRL
    echo 'Setting Caps Lock key to Control, Linux only!'
    xmodmap -e 'clear lock'
    xmodmap -e 'keycode 0x42 = Control_L'
    xmodmap -e 'add Control = Control_L'
end

# Load the login settings for the proxy from a different file
source ~/.config/p.fish

# Configure ING Proxy
function proxy
    echo 'Configuring Proxy'

    set serverip "proxynldcv.europe.intranet"
    set serverport "8080"
    set username $u 
    set password $p 
    set proxypath "http://$username:$password@$serverip:$serverport"

    set -x http_proxy $proxypath
    set -x HTTP_PROXY $proxypath
    set -x https_proxy $proxypath
    set -x HTTPS_PROXY $proxypath
    set -x ftp_proxy $proxypath
    set -x FTP_PROXY $proxypath

    set -x all_proxy $proxypath
    set -x ALL_PROXY $proxypath

    set -x no_proxy "127.0.0.1, localhost,*.europe.intranet,*.ict.intranet"
    set -x NO_PROXY "127.0.0.1, localhost,*.europe.intranet,*.ict.intranet"

    echo 'Configured proxy to $serverip'
end

# Disable Proxy settings
function noproxy
    echo 'Deleting proxy setting'
    set -x http_proxy ''
    set -x HTTP_PROXY ''
    set -x https_proxy ''
    set -x HTTPS_PROXY ''
    set -x ftp_proxy ''
    set -x FTP_PROXY ''
end

# Make vim the default $EDITOR
set -U EDITOR 'vim'

# Alias to quickly reload fish 
alias refish "source ~/dev/dotfiles/fish/config.fish"

# Custom welcome message
function fish_greeting
    # Disabled logo
    # I like the clean prompt better
    #cat ~/dev/dotfiles/fish/logo.txt
end

# Git commit, and prompt for commit message
# Usage:
# gcm
# .. type your shitty commit message
# <enter>
function gcm 
    read -l -p git_commit_message message
    git commit -m $message
    return 0
end

function git_commit_message
    echo 'Enter your git commit message: '
end

# Function to push current branch to origin
function pushbranch
    set branch (git rev-parse --abbrev-ref HEAD)
    git push origin $branch
end

# Function to pull current branch from origin
function pullbranch
    set branch (git rev-parse --abbrev-ref HEAD)
    git pull origin $branch
end


# Open confluence search
function confluence
    open 'https://confluence.europe.intranet/dosearchsite.action?queryString=$args[1]'
end

# LESS with colors
# from http://blog.0x1fff.com/2009/11/linux-tip-color-enabled-pager-less.html
#set -x LESS "-RSM~gIsw"

# Colorful man pages
# from http://pastie.org/pastes/206041/text
setenv -x LESS_TERMCAP_mb (set_color -o red)
setenv -x LESS_TERMCAP_md (set_color -o red)
setenv -x LESS_TERMCAP_me (set_color normal)
setenv -x LESS_TERMCAP_se (set_color normal)
setenv -x LESS_TERMCAP_so (set_color -b blue -o yellow)
setenv -x LESS_TERMCAP_ue (set_color normal)
setenv -x LESS_TERMCAP_us (set_color -o green)

