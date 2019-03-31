#!/bin/sh
echo "Установка Ruby..."
echo "Обновляем apt и устанавливаем Ruby и Bundler..."
apt update
apt install -y ruby-full ruby-bundler build-essential

