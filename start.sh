#!/bin/bash

export YANDEX_USER
export YANDEX_PASSWORD
export YANDEX_FOLDER

echo "Generating token"
# Generate token
yandex-disk token --password $YANDEX_PASSWORD $YANDEX_USER

echo "Starting yandex-disk"
# Run service
yandex-disk start --dir /root/yandex_disk -D
