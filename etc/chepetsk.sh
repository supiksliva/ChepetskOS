# ChepetskOS System-wide Shell Configuration & Aliases
# Загружается при входе в терминал

# Понятия файловой системы
alias shmon="ls -la --color=auto"
alias poyti="cd"
alias gde_ya="pwd"
alias v_cheptsu="rm -rf"
alias nadybat="touch"
alias vskryt="cat"
alias dver_naraspashku="chmod 777"
alias zapret="chmod 000"

# Разборки с процессами
alias kto_na_raione="ps aux | grep -v 'root'"
alias shurit="grep"
alias probyev="ping -c 4"
alias shmon_diska="df -h"
alias zanyat_sotku="free -h"

# Власть и отруб
alias krysha="sudo"
alias pereдоз="kill -9"
alias v_otkluchku="shutdown -h now"
alias s_boduna="reboot"

# Кастомный промпт (PS1): [КУМАРЫ: <load>] юзер@подъезд:путь $
export PS1="\[\033[1;31m\][КУМАРЫ: \$(cat /proc/loadavg 2>/dev/null | cut -d' ' -f1)] \[\033[1;33m\]\u\[\033[0m\]@\[\033[1;35m\]подъезд:\[\033[1;36m\]\w\[\033[0m\] \$ "

# Автозапуск chepfetch при открытии интерактивного шелла
if [ -t 0 ] && [ -n "$PS1" ] && command -v chepfetch >/dev/null 2>&1; then
    chepfetch
fi
