alias dotfiles='cd ~/dotfiles/'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias  cp='cp -i' # paranoia
alias  mv='mv -i' # paranoia
alias  rm='rm -i' # paranoia

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Lazy ancestor directory ziggurat of doom
alias        ..='cd ..'
alias       ...='cd ../..'
alias      ....='cd ../../..'
alias     .....='cd ../../../..'
alias    ......='cd ../../../../..'
alias   .......='cd ../../../../../..'
alias  ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
