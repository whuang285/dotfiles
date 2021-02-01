#vpn
vpn() {
    #systemctl "$@" wg-quick@criticalstack.service
    nmcli connection "$1" "$2"
}

#wifi
wifi() {
    nmcli device wifi "$@"
}

#bluetooth
bluetooth() {
    if [ "$2" = "airpods" ]; then
        device="9C:64:8B:79:AA:F4"
    elif [ "$2" = "keyboard" ]; then
        device="10:94:BB:BD:AA:3A"
    else 
        device=""
    fi
    echo -e "$1" "$device" | bluetoothctl
}
