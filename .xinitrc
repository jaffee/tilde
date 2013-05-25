xrandr --dpi 91
dropbox start

while true; do
    batt=$(LC_ALL=C acpi -b)

    case $batt in
	*Discharging*)
	    batt="${batt#* * * }"
	    batt="${batt%%, *} "
	    ;;
	*)
	    batt=""
	    ;;
    esac

    xsetroot -name "$batt"
    sleep 6
done &

exec ssh-agent ~/tilde/scripts/startdwm
