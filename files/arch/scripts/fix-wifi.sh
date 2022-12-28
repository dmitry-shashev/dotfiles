# lsmod | grep wifi
# it helps for arch linux

sudo rmmod iwlmvm
sudo rmmod iwlwifi
sudo rmmod iwlmei
sudo rmmod mac80211
sudo rmmod cfg80211

sudo modprobe iwlmvm
sudo modprobe iwlwifi
sudo modprobe iwlmei
sudo modprobe mac80211
sudo modprobe cfg80211

