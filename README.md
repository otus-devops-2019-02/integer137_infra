# integer137_infra
integer137 Infra repository

##"ДЗ ansible-4"

"Провели установку Virtualbox и Vagrant."

"В директории ansible создали файл Vagrantfile с конфигурацией виртуальных машин."

"Создали виртуалки, используя команду ````vagrant up````."

"Используем команды ````vagrant box list```` и ````vagrant status```` для просмотра загруженных боксов и состояния виртуальных машин."

"Используем команду ````vagrant ssh appserver```` для подключения к виртуальному серверу приложений и проверям сетевое соединение с сервером БД."

"Используем команду ````vagrant provision dbserver```` для запуска провиженера на dbserver."

"Добавили плейбук base.yml, в котором описана установка python."

"Доработали роль db для установки MongoDB и его конфигурации. Также исправили порядок запуска тасков."

"Осуществили проверку роли DB."

"Доработали роль app для настройки хоста приложения и puma сервера. Также исправили порядок запуска тасков."

"Определили Ansible провижинер для хоста appserver."

"Дорабатываем роль app. Параметризируем имя пользователя."

"Осуществляем проверку приложения по адресу 10.10.10.20:9292."

"Удаляем окружение командой ````vagrant destroy -f````."

"Провели установку модулей Molecule, Ansible, Testinfra в среде virtualenv."

"Создали заготовку тестов для роли db командой ````molecule init````."

"Создали тестовую машину командой ````molecule create````."

"Проводим тестирование роли. Применили конфигурацию прогнали тесты."

"Проведена самостоятельная работа. Написан тест на прослушивание порта 27017, использованы роли в плейбуках packer'а."

##"ДЗ ansible-3"

"Создали заготовки ролей с помощью команд ````ansible-galaxy init````."

"Копировали таски, хэндлеры, темплейты, файлы и переменные в структуры ролей app и db."

"Сконфигурировали файлы app.yml и db.yml для вызова ролей."

"Осуществили проверку ролей командой:"
````
ansible-playbook site.yml --check
````
"Запустили плейбук и проверили работу приложения."

"Создали окружения stage и prod в директории environments."

"Создали директорию group_vars в окружениях stage и prod для определения переменных групп хостов."

"Создали файлы app и db в директории group_vars и внесли в них необходимые переменные."

"Организовали вывод информации об окружении в ролях app и db."

"Перемещаем старые файлы в папки playbooks и old директории ansible."

"Проверяем работу окружений stage и prod."

"Установили роль jdauphant.nginx с портала Ansible galaxy."

"Настроили обратное проксирование nginx с порта 9292 на порт 80."

"Научились работать с ansible vault, используя файл ключа."

"Задание со *. Настроили динамическое инвентори для окружений stage и prod."

##"ДЗ ansible-2"

"Создали плейбук reddit_app.yml."

"Создали сценарий для MongoDB в плейбуке reddit_app.yml."

"Создали шаблон mongod.conf.j2."

"Провели пробный прогон командой ansible-playbook."

"Научились определять переменные внутри плейбука."

"Научились определять handler-ы в плейбуке."

"Создали unit-файл для приложения puma."

"Создали шаблон db_config.j2 для приложения."

"Провели настройку инстанса приложения, используя ````ansible-playbook reddit_app.yml --limit app --tags app-tag````."

"Добавили несколько тасков в плейбук для деплоя приложения."

"Выполнили deploy приложения. Провели проверку работоспособности приложения."

"Создали плейбук для нескольких сценариев reddit_app2.yml."

"Добавили сценарий для MongoDB."

"Добавили сценарий для App."

"Пересоздали инфраструктуру, используя terraform."

"Осуществили проверку сценариев для MongoDB и App."

"Добавили сценарий для деплоя."

"Провели настройку приложения, используя команды:"

````ansible-playbook reddit_app2.yml --tags db-tag````

````ansible-playbook reddit_app2.yml --tags app-tag````

````ansible-playbook reddit_app2.yml --tags deploy-tag````

"Провели проверку работоспособности приложения."

"Создали несколько плейбуков app.yml, db.yml, deploy.yml."

"Пересоздали инфраструктуру, используя terraform."

"Провели настройку приложения командой ````ansible-playbook site.yml````."

"Провели проверку работоспособности приложения."

"Задание с *. Для динамического инвентори выбран плагин gcp_compute. Создан  файл inventory.gcp.yml с настройками для плагина gcp_compute. В файл ansible.cfg внесены соответствующие изменения. Для запуска плейбука используется команда:"
````ansible-playbook site.yml````

"Проведены изменения провижининга в Packer."

"Созданы новые образы с помощью плейбуков Ansible."

"Проведена проверка образов c помощью плейбука site.yml."

##"ДЗ ansible-1"

"Провели установку Ansible."

"Создали инвентори файл для управления нашими хостами."

"Проверка работы командой: ````ansible dbserver -i inventory -m ping````."

"Создали файл конфигурации ansible.cfg для указания параметров"

"Проверка работы командой: ````ansible dbserver -m command -a uptime````."

"Указываем в инвентори файле группы хостов"

"Проверка работы командой: ````ansible app -m ping````."

"Создали файл YAML Inventory. Проверка ````ansible all -m ping -i inventory.yml````."

"Создаем простой плейбук clone.yml."

"Выполняем ````ansible-playbook clone.yml```` для клонирования репозитория."

"Выполняем ````ansible app -m command -a 'rm -rf ~/reddit'```` после этого запускаем плейбук clone.yml. Видим статус changed при выполнении таска clone repo. Так как директория reddit была удалена, таск копирует ее вновь, после этого возникает статус changed."

"Создан файл inventory.json. Команда ````ansible all -m ping```` выполняется успешно."

"inventory.json генерируется на лету bash-скриптом inventory.sh."

##"ДЗ terraform-2"

"Определили ресурс файервола. Не удается создать правило, т.к. имя уже имеющегося совпадает с новым."

"Выполнили terraform import для импорта существующего правила."

"Создали ресурс ip адреса."

"Создали 2 новых шаблона для Packer db.json и app.json."

"Собрали образы Packer-ом. Составляем конфигурационные файлы для Terraform (app.tf, db.tf, vpc.tf). Инфраструктура успешно создается. Удаляем."

"Создали модули app и db."

"Создали модуль vpc."

"Добавили переменную source_ranges в модуль vpc."

"Создали инфраструктуру для двух окружений (stage и prod)."

"Провели настройку хранения стэйт файла в удаленном бекенде "GCS."

"Перенесли конфигурацию в директорию вне репозитория. Осуществили проверку видимости текущего состояния инфраструктуры."

"Осуществили одновременный запуск применения конфигурации. Terraform запущенный вторым сообщил об ошибке, state-файл в бакете заблокирован для записи."

"Добавление и настройка provisioner в модулях app и db, использование переменной db_internal_ip в модуле app для автоматического деплоя приложения."

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

