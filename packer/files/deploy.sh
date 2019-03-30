#!/bin/sh
# Скрипт деплоя приложения
echo "Копируем код приложения..."
cd $HOME
git clone -b monolith https://github.com/express42/reddit.git
echo "Переходим в директорию проекта и устанавливаем зависимости..."
cd reddit && bundle install
echo "Добавляем в автозагрузку..."
mv /home/appuser/puma_reddit.service /etc/systemd/system/puma_reddit.service
systemctl daemon-reload
systemctl enable puma_reddit.service

