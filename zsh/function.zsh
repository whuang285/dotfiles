#vpn
vpn() {
    systemctl "$@" wg-quick@criticalstack.service
}

#wifi
wifi() {
    nmcli device wifi "$@"
}
