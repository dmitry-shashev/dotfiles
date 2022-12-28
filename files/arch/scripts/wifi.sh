systemctl restart NetworkManager.service
sleep 2

iwctl station wlan0 scan
iwctl station wlan0 get-networks

read -p "Enter WiFi name: " wifiName

iwctl station wlan0 connect $wifiName

