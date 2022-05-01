
#while true
#do
# dialog --backtitle "Test" \
# --title "Checkbox test " \
# --checklist "Choose from following"  0 0 0 \
# apple "The apple is green" on \
# mango "The mango is golden" on \
# 2> /var/tmp/optional.out
# OPTIONAL=`cat /var/tmp/optional.out | \
#    sed -e "s/\"//g" -e "s/ /|/g" -e "s/|$//"`
#    echo 'optional :'$OPTIONAL
    
#done

#!/bin/bash
DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}
while true; do
 exec 3>&1   # ***************
 selection=$(dialog \
    --backtitle "System Information" \
    --title "Menu" \
    --clear \
    --cancel-label "Exit" \
    --checklist "Please select:" $HEIGHT $WIDTH 4 \
    Apache "Apache" on \
    Mysql "Mysql" on \
    Status "Status" on \
  2>&1 1>&3)  #********************
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Program terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac
  case $selection in
    1 )
      result=$(echo "Hostname: $HOSTNAME"; uptime)
      display_result "System Information"
      ;;
    2 )
      result=$(df -h)
      display_result "Disk Space"
      ;;
  esac	

done
