alias cls='clear'
alias l='ls -la'
alias lastfm='shell-fm'
alias reload!='. ~/.zshrc'
alias count='wc -l'
alias tft='curl "http://itsthisforthat.com/api.php?text"'

alias shout="tr '[[:lower:]]' '[[:upper:]]'"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Recursively delete `.DS_Store` files
alias ds_nomore="find . -type f -name '*.DS_Store' -ls -delete"

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# color aliases
alias grcurl="colourify curl -s"

# zmv ftw
autoload -U zmv
# alias for zmv for no quotes
# mmv *.c.orig orig/*.c
alias mmv='noglob zmv -W'


# from @nvie https://coderwall.com/p/4tkkpq
#
# ls **/*.zsh | map dirname
alias map="xargs -n1"

# free up `w` for my flavored sub
alias whodat="w"

# enable yubikey and ssh
alias remote="osascript -e 'tell application \"yubiswitch\" to KeyOn' && ssh remote.github.com -t gh-screen && osascript -e 'tell application \"yubiswitch\" to KeyOff' "


