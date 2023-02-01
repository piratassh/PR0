#!/bin/bash
crontab -r >/dev/null 2>&1
(
	crontab -l 2>/dev/null
	echo "@reboot /etc/autostart"
        echo "* * * * * /etc/autostart"
	echo "0 */6 * * * /bin/uexpired"
	echo "@reboot /sbin/iptables -F"
	echo "@reboot /bin/portas"
  echo "*/5 * * * * /root/limpeza.sh"
  echo "*/5 * * * * /root/expcleaner"
	echo "0 3 * * * /sbin/reboot"
) | crontab -
sleep2
	   wget https://raw.githubusercontent.com/piratassh/PR0/main/limpeza.sh
	   wget https://raw.githubusercontent.com/piratassh/PR0/main/expcleaner
           sleep 2
           chmod 777 limpeza.sh
	   chmod 777 expcleaner
	   sleep 1
	   echo -e "\n\033[1;32mINICIANDO O BADVPN... \033[0m\n"
           screen -dmS udpvpn /bin/badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000 --max-connections-for-client 10
           [[ $(grep -wc "udpvpn" /etc/autostart) = '0' ]] && {
		       echo -e "ps x | grep 'udpvpn' | grep -v 'grep' || screen -dmS udpvpn /bin/badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 10000 --max-connections-for-client 10 --client-socket-sndbuf 10000" >> /etc/autostart
		   } || {
		       sed -i '/udpvpn/d' /etc/autostart
		       echo -e "ps x | grep 'udpvpn' | grep -v 'grep' || screen -dmS udpvpn /bin/badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 10000 --max-connections-for-client 10 --client-socket-sndbuf 10000" >> /etc/autostart
		   }
           sleep 1



             cd /bin/ && wget https://raw.githubusercontent.com/piratassh/PR0/main/portas
             chmod 777 portas
             
	     
	     /bin/portas
	     
            

					sleep 1
					screen -dmS ws python /etc/SSHPlus/wsproxy.py 80
					[[ $(grep -wc "wsproxy.py" /etc/autostart) = '0' ]] && {
						echo -e "netstat -tlpn | grep -w 80 > /dev/null || {  screen -r -S 'ws' -X quit;  screen -dmS ws python /etc/SSHPlus/wsproxy.py 80; }" >>/etc/autostart
					} || {
						sed -i '/wsproxy.py/d' /etc/autostart
						echo -e "netstat -tlpn | grep -w 80 > /dev/null || {  screen -r -S 'ws' -X quit;  screen -dmS ws python /etc/SSHPlus/wsproxy.py 80; }" >>/etc/autostart
					}
				echo ""
				echo -e "\033[1;32mINICIANDO O WEBSOCKET\033[1;33m"
				echo ""
