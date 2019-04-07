# integer137_infra
integer137 Infra repository

##"ДЗ terraform-1"
"Произведена установка Terraform"

"На основе конфигурационных файлов Terraform создан инстанс ВМ, использован образ reddit-base"

"Произведена требуемая параметризация"

"Определены input переменные"

"Выполнена команда terraform fmt"

"Описано добавление нескольких ключей пользователей"
````
resource "google_compute_project_metadata" "ssh_keys" {
  metadata {
  ssh-keys = "appuser:${file(var.public_key_path)}\nappuser1:${file(var.public_key_path)}\nappuser2:${file(var.public_key_path)}\nappuser3:${file(var.public_key_path)}"
}
}
````
"Через web-интерфейс добавлен пользователь appuser_web в метаданные проекта, после выполнения ````terraform apply```` данный пользователь удаляется"

"Создан конфигурационный файл lb.tf в котором описано создание http балансировщика"

"В output переменные добавлен адрес балансировщика"

"Создан инстанс reddit-app2, добавлен в балансировщик. В output переменные добавлен ip-адрес второго инстанса."

"При такой конфигурации приложения получаем различные базы данных на 2-х инстансах, избыточность кода в конфигурационном файле main.tf"

"Удалено описание reddit-app2, задано количество инстансов через параметр count"

##"ДЗ packer-base"
"Создан шаблон Packer ubuntu16.json"

"Шаблон параметризирован, создан файл variables.json"
````
{
    "project_id": "infra-235107",
    "source_image_family": "ubuntu-1604-lts"
}
````
"Создан образ VM семейства reddit-base"

"Выполнено задание со (*)"

"Создан шаблон Packer immutable.json"
"Созданы файлы puma_reddit.service и puma_start.sh для автозапуска службы через systemd unit"
````
[Unit]
Description = Start Puma_reddit Service
After=network.target

[Service]
Type=forking
ExecStart=/home/appuser/puma_start.sh

[Install]
WantedBy=multi-user.target
````
````
#!/bin/sh
cd /home/appuser/reddit
echo "Запускаем сервер приложения..."
puma -d
````
"Создан образ VM семейства reddit-full"

"Для ускорения запуска VM создан скрипт create-reddit-vm.sh"
````
#!/bin/sh
gcloud compute instances create reddit-app1 \
	--boot-disk-size=10GB \
	--image-family reddit-full \
	--image-project=infra-235107 \
	--machine-type=f1-micro \
	--zone europe-west1-b \
	--tags puma-server \
	--restart-on-failure
````

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
	--metadata startup-script-url=gs://integer137_infra/startup_script.sh \
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

