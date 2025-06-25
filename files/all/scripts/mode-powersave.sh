echo "Old Mode"
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
sudo cpufreq-set -g powersave
echo "New Mode"
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
