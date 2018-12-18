#!/bin/bash

CUR_DIR_FROM="${PWD:0:4}"

echo $CUR_DIR_FROM

if [[ $CUR_DIR_FROM == *"/var"* ]]
then
    APPLICATION_DIR=/private$PWD/app
else
    APPLICATION_DIR=$PWD/app
fi

echo $APPLICATION_DIR

docker run --rm --interactive --tty --volume $APPLICATION_DIR:/var/www/current --env=APP_ENV=dev --env=APP_DEBUG=1 w1nsun/composer:1.0 install
docker-compose up -d

sleep 2

echo "Copying vendor to php ..."
docker cp ./app/vendor/ game_php:/var/www/current/

echo "Copying vendor to web ..."
docker cp ./app/vendor/ game_web:/var/www/current/

docker-compose run --rm game_php_cli bin/console doctrine:database:create
docker-compose run --rm game_php_cli bin/console doctrine:migrations:migrate
