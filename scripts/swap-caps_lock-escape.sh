 #!/bin/bash
 setxkbmap -option caps:none
 xmodmap -e "keycode 66 = Escape"
 xmodmap -e "keycode 9 = Caps_Lock"

 exit 0
