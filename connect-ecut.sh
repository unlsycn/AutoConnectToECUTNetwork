#!/usr/bin/env bash

target_host="172.21.255.105:801"
user_account=""
user_password=""
isp="" # 中国移动 - cmcc | 中国联通 - unicom | 中国电信 - telecom | 校园网 - 留空
user_mac="0123456789ab"
random=$(shuf -i 1000-9999 -n 1)

headers=(
    "-H" "Host: $target_host"
    "-H" "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0"
)

send_request() {
    local user_ip=$(ip -4 addr show "$1" | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    [[ -z $user_ip ]] && return 1
    local uri=$(echo "http://$target_host/eportal/?c=Portal&a=login&callback=dr1004&login_method=1&user_account=${user_account}%40${isp}&user_password=${user_password}&wlan_user_ip=${user_ip}&wlan_user_ipv6=&wlan_user_mac=${user_mac}&wlan_ac_ip=&wlan_ac_name=&jsVersion=3.3.3&v=${random}")
    curl --noproxy "*" "${headers[@]}" "$uri"
}

# eth0 | wlan0 | ...
send_request "eth0"
send_request "wlan0"
