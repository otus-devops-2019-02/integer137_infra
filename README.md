# integer137_infra
integer137 Infra repository

"Подключение одной командой"
ssh -i ~/.ssh/appuser -t -A appuser@34.76.58.42 ssh 10.128.0.2

"Подключение командой вида "ssh someinternalhost""
touch ~/.ssh/config && chmod 600 ~/.ssh/config
nano ~/.ssh/config
    Host someinternalhost
    HostName 34.76.58.42
	Port 22
	User appuser
	IdentityFile /home/user/.ssh/appuser
	RequestTTY force
	RemoteCommand ssh 10.128.0.2
	ForwardAgent yes
ssh someinternalhost

"С помощью сервиса xip.io и Let's Encrypt реализовано использование сертификата"
https://34.76.58.42.xip.io
bastion_IP = 34.76.58.42
someinternalhost_IP = 10.128.0.2
