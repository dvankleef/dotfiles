# When gisting a file. make it private by default and copy to clipboard
alias gist "gist -c --private"

# Easy accessible vim
alias vi vim

# Commandline shortcuts
alias l ls
alias c clear

# Function to push current branch to origin
function pushbranch
    set branch (git rev-parse --abbrev-ref HEAD)
    git push origin $branch
end

# Git aliasses
alias gc "git commit"
alias gs "git status"
alias gl "git log"
alias gd "git diff"
alias ga "git add"
alias gp "git push"
alias gdc "git diff --cached"
alias gpb "pushbranch"
alias gcm "git commit -m"
#alias gca "git add -A && git commit"

# JIRASH
alias jirash "~/dev/jirash/bin/jirash"

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
