source archiving.sh
source copy.sh
INPUT=/tmp/menu.sh.$$
vi_editor=${EDITOR-vi}

trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM


function display_output(){
    local h=${1-10}         # box height default 10
    local w=${2-41}         # box width default 41
    local t=${3-Output}     # box title 
    dialog --backtitle "Linux Shell Script" --title "${t}" --clear --msgbox "$(<$OUTPUT)" ${h} ${w}
}




dialog --clear  --help-button --backtitle "" \
--title "[ M A I N - M E N U ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 15 50 4 \
Pydf "lancer la commande Pydf" \
Fdisk "Lancer la commande fdisk" \
help  "Help" \
Exit "Quittez" 2>"${INPUT}"

menuitem=$(<"${INPUT}")

case $menuitem in
    Pydf) copy;;
    Fdisk) archive;;
    help) help;;
    Exit) echo "Bye"; break;;
esac


[ -f $OUTPUT ] && rm $OUTPUT
[ -f $INPUT ] && rm $INPUT