$TargetHost = "172.21.255.105:801"
$UserAccount = ""
$UserPassword = ""
$ISP = "" # 中国移动 - cmcc | 中国联通 - unicom | 中国电信 - telecom | 校园网 - 留空
$UserMAC = "0123456789ab"
$Random = Get-Random -Maximum 9999 -Minimum 1000

$Headers = @{
    "Host" = $TargetHost
    "User-Agent" = "Mozilla/5.0 (Windows 98; Win 9x 4.90; en-US; rv:1.9.1.20) Gecko/20160423 Firefox/35.0"
}

function Get-IPAddress($NIC) {
    Get-NetIPAddress -InterfaceAlias $NIC -AddressFamily IPv4 | select -exp IPv4Address
}

function Get-Uri($UserIP) {
    "http://" + $TargetHost + "/eportal/?c=Portal&a=login&callback=dr1004&login_method=1&user_account=" + $UserAccount + "%40" + $ISP + "&user_password=" + $UserPassword + "&wlan_user_ip=" + $UserIP + "&wlan_user_ipv6=&wlan_user_mac=" + $UserMAC + "&wlan_ac_ip=&wlan_ac_name=&jsVersion=3.3.3&v=" + $Random
}

function Send-Request($NIC) {
    $UserIP =  Get-IPAddress $NIC
    $Uri = Get-Uri $UserIP
    $Response = Invoke-WebRequest -Uri $Uri -Headers $Headers
}

# 以太网 | WLAN | ...
Send-Request "以太网"
Send-Request "WLAN"