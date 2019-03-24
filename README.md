# integer137_infra
integer137 Infra repository

##"ДЗ cloud-testapp"
"Добавлены скрипты install_ruby.sh, install_mongodb.sh и deply.sh"
testapp_IP = 35.195.24.181
testapp_port = 9292

"Добавлен скрипт startup_script для запуска при создании инстанса командой gcloud"
````
gcloud compute instances create reddit-app \
	--boot-disk-size=10GB \
	--image-family ubuntu-1604-lts \
	--image-project=ubuntu-os-cloud \
	--machine-type=g1-small \
	--tags puma-server \
	--metadata-from-file startup-script=startup_script.sh \
	--restart-on-failure
````
````
gcloud compute instances create reddit-app \
	--boot-disk-size=10GB \
	--image-family ubuntu-1604-lts \
	--image-project=ubuntu-os-cloud \
	--machine-type=g1-small \
	--tags puma-server \
	--metadata startup-script-url=gs://integer137_infra/startup_script.sh
	--restart-on-failure
````	
"Добавлена команда для создания правила firewall с помощью gcloud"
````
gcloud compute firewall-rules create default-puma-server  \
 	--network default \
    --action allow \
    --direction ingress \
    --rules tcp:9292 \
    --source-ranges 0.0.0.0/0 \
    --priority 1000 \
    --target-tags puma-server
````

##"ДЗ cloud-bastion"
"Подключение одной командой"
````
ssh -i ~/.ssh/appuser -t -A appuser@34.76.58.42 ssh 10.128.0.2
````
"Подключение командой вида "ssh someinternalhost""
````
touch ~/.ssh/config && chmod 600 ~/.ssh/config
````
````
nano ~/.ssh/config \
    Host someinternalhost \
    HostName 34.76.58.42 \
	Port 22 \
	User appuser \
	IdentityFile /home/user/.ssh/appuser \
	RequestTTY force \
	RemoteCommand ssh 10.128.0.2 \
	ForwardAgent yes \
````
````
ssh someinternalhost 
````
"С помощью сервиса xip.io и Let's Encrypt реализовано использование сертификата"
https://34.76.58.42.xip.io

"Файлы setupvpn.sh и cloud-bastion.ovpn добавлены"
bastion_IP = 34.76.58.42
someinternalhost_IP = 10.128.0.2

