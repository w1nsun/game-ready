#!/bin/bash

COMPOSER_COMMAND="$@"

CUR_DIR_FROM="${PWD:0:4}"

echo $CUR_DIR_FROM

if [[ $CUR_DIR_FROM == *"/var"* ]]
then
    APPLICATION_DIR=/private$PWD/app
else
    APPLICATION_DIR=$PWD/app
fi

echo $APPLICATION_DIR

docker run --rm --interactive --tty --volume $APPLICATION_DIR:/var/www/current --env=APP_ENV=dev --env=APP_DEBUG=1 w1nsun/composer:1.0 $COMPOSER_COMMAND
