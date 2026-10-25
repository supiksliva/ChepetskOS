#!/usr/bin/env bash

# ChepetskOS Automated Installer
# Накатывает понятия Кирово-Чепецка на твою чистую систему

set -e

C_RED="\033[1;31m"
C_YELLOW="\033[1;33m"
C_GREEN="\033[1;32m"
C_RESET="\033[0m"

echo -e "${C_RED}=====================================================${C_RESET}"
echo -e "${C_RED}   УСТАНОВКА CHEPETSK-OS (KROKODIL HARDCORE CORE)    ${C_RESET}"
echo -e "${C_RED}=====================================================${C_RESET}"

if [ "$EUID" -ne 0 ]; then
    echo -e "${C_RED}[!] Без крыши ментов (root) установить не получится! Запусти через sudo.${C_RESET}"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${C_YELLOW}[1/4] Перебиваем файловую систему по понятиям...${C_RESET}"
ln -sfn /home /hata
ln -sfn /tmp /pomoyka
ln -sfn /etc /ponyatiya
ln -sfn /dev/null /dev/reka-cheptsa

echo -e "${C_YELLOW}[2/4] Копируем чепецкий софт в /usr/local/bin...${C_RESET}"
install -m 755 "$SCRIPT_DIR/bin/chepfetch" /usr/local/bin/chepfetch
install -m 755 "$SCRIPT_DIR/bin/bayan" /usr/local/bin/bayan
install -m 755 "$SCRIPT_DIR/bin/nalivayka" /usr/local/bin/nalivayka
install -m 755 "$SCRIPT_DIR/bin/lomkatop" /usr/local/bin/lomkatop
install -m 755 "$SCRIPT_DIR/bin/detect-trezvost" /usr/local/bin/detect-trezvost
install -m 755 "$SCRIPT_DIR/bin/krokodil-killer" /usr/local/bin/krokodil-killer
install -m 755 "$SCRIPT_DIR/bin/krokodil-av" /usr/local/bin/krokodil-av

echo -e "${C_YELLOW}[3/4] Устанавливаем сводку ментовки (MOTD) и шелл-алиасы...${C_RESET}"
install -m 644 "$SCRIPT_DIR/etc/motd" /etc/motd
install -m 644 "$SCRIPT_DIR/etc/chepetsk.sh" /etc/profile.d/chepetsk.sh

# Добавляем подгрузку в ~/.bashrc для надежности
USER_HOME=$(eval echo ~${SUDO_USER:-$USER})
if [ -f "$USER_HOME/.bashrc" ]; then
    if ! grep -q "chepetsk.sh" "$USER_HOME/.bashrc"; then
        echo -e "\n[ -f /etc/profile.d/chepetsk.sh ] && source /etc/profile.d/chepetsk.sh" >> "$USER_HOME/.bashrc"
    fi
fi

echo -e "${C_YELLOW}[4/4] Замена имени хоста на 'chepetsk-narkologia'...${C_RESET}"
if [ -f /etc/hostname ]; then
    echo "chepetsk-narkologia" > /etc/hostname
fi

echo -e "\n${C_GREEN}=====================================================${C_RESET}"
echo -e "${C_GREEN}[✔] ПОЗДРАВЛЯЕМ! СИСТЕМА УСПЕШНО ПРИВЕДЕНА К ЧЕПЕЦКОМУ ВИДУ!${C_RESET}"
echo -e "${C_GREEN}Перезапусти шелл или выполни 'source /etc/profile.d/chepetsk.sh'${C_RESET}"
echo -e "${C_GREEN}=====================================================${C_RESET}\n"

/usr/local/bin/chepfetch || true
