#!/bin/sh
echo "Установка Mongodb..."
echo "Добавляем ключи и репозиторий MongoDB..."
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list
echo "Обновляем список доступных пакетов и устанавливаем mongodb-org..."
apt update
apt install -y mongodb-org
echo "Запускаем MongoDB..."
systemctl start mongod
echo "Добавляем MongoDB в автозапуск..."
systemctl enable mongod

