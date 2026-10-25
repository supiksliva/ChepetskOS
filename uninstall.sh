#!/usr/bin/env bash

# ChepetskOS Uninstaller (Процедура кодирования)
# Смывает все понятия и возвращает систему в трезвый вид

if [ "$EUID" -ne 0 ]; then
    echo "Только с правами root можно закодироваться!"
    exit 1
fi

echo -e "\033[1;33m[~] Принудительная госпитализация и откачивание системы...\033[0m"

rm -f /usr/local/bin/chepfetch
rm -f /usr/local/bin/bayan
rm -f /usr/local/bin/nalivayka
rm -f /usr/local/bin/lomkatop
rm -f /usr/local/bin/detect-trezvost
rm -f /usr/local/bin/krokodil-killer
rm -f /usr/local/bin/krokodil-av

rm -f /etc/profile.d/chepetsk.sh
rm -f /hata /pomoyka /ponyatiya /dev/reka-cheptsa

echo -e "\033[1;32m[✔] Выписан из диспансера. Система снова трезвая и скучная.\033[0m"
