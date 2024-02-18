TELEGRAM_ARCH_PATH=/tmp/telegram.tar.xz
TELEGRAM_TEMP_FOLDER=/tmp/Telegram

killall telegram-desktop
wget -O $TELEGRAM_ARCH_PATH https://telegram.org/dl/desktop/linux 

tar -xvf $TELEGRAM_ARCH_PATH -C /tmp

sudo mv $TELEGRAM_TEMP_FOLDER/Telegram /usr/bin/telegram-desktop

rm $TELEGRAM_ARCH_PATH
rm -rf $TELEGRAM_TEMP_FOLDER

telegram-desktop &

