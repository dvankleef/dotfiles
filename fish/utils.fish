#################################
### Network Related
#################################

alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ and print $1'"
alias whois="whois -h whois-servers.net"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Start a comnand with 'server' and open the local browser on that address
function server --description "Start an HTTP server from a directory"
  open http://localhost:8080/ 
  and python -m SimpleHTTPServer 8080
end 

# Returns my ip address on the public web
alias myip="curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'"


################################
###  Unix Related
################################

# File size
alias fs="stat -f \"%z bytes\""

# Make and cd to a directory (recursively)
function md
  mkdir -p "$argv"; cd "$argv"
end


# Kill a process interactively
function pkill --description "pkill a process interactively"
  ps aux | peco | awk '{ print $2 }' | xargs kill
end

# Auto ls for each cd
function cd --description "auto ls for each cd"
  if [ -n $argv[1] ]
    builtin cd $argv[1] 
    and ls -AF
  else
    builtin cd ~ 
    and ls -AF
  end
end

function peco_select_history
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end

  history|peco $peco_flags|read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end


################################
###  Mac OS Related
################################
# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# Empty the Trash
alias emptytrash="rm -rfv ~/.Trash"


# Hide/show all desktop icons (useful when presenting)
#alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
#alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"



################################
###  I am an Idiot
################################
# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"
