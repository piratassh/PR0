#!/bin/bash

apt install dialog

dialog --title 'PIRATA SSHPLUS - REINICIAR O SERVIDOR' --msgbox ' ATENÇÃO! Este script criará uma tarefa cron para reinício automático. Escolha o horário na próxima tela.' 8 60

hora=$(dialog --inputbox "Digite a que horas deseja reiniciar o servidor (0 a 23 horas)" 10 25 --stdout)

minuto=$(dialog --inputbox "Digite o minuto de hora que deseja reiniciar o servidor (0 a 59 minutos)" 10 25 --stdout)

dialog --title 'Horário definido' --msgbox "O servidor será reiniciado automáticamente às $hora horas e $minuto minutos diariamente" 8 60

clear
sed -i '/jarvisvpn/d' /etc/crontab
mkdir /root/jarvisvpn/
chmod 777 /root/jarvisvpn/
rm /root/jarvisvpn/reiniciar2.sh
touch /root/jarvisvpn/reiniciar2.sh
chmod 777 /root/jarvisvpn/reiniciar2.sh
echo "reboot" >> /root/jarvisvpn/reiniciar2.sh
echo "$minuto $hora * * * root /root/jarvisvpn/reiniciar2.sh" >> /etc/crontab
/etc/init.d/cron reload > /dev/null 2>&1
/etc/init.d/cron restart > /dev/null 2>&1
dialog --title "Sucesso" --infobox "Operação Concluída. Dúvidas chame @PIRATA SSHPLUS" 8 50
sleep 2
rm reiniciar.sh
clear





