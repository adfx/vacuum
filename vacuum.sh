#!/bin/sh

echo
date
echo $0

if [ ! -r "$1" ]; then
    echo "File not found!"
    exit 1
fi

./builder_vacuum.sh     --run-custom-script=ALL \
                        --timezone=Europe/Berlin \
                        --ntpserver=pool.ntp.org \
                        --dnsserver="8.8.8.8, 114.114.114.114" \
                        --root-pass=cleaner \
                        --custom-user=cleaner \
                        --custom-user-pass=cleaner \
                        --enable-greeting \
                        --enable-addon \
                        --enable-binding \
                        --enable-turn-off-ny \
                        --disable-logs \
                        --enable-ramdisk \
                        --disable-firmware-updates \
                        --replace-adbd \
                        --enable-appproxy-patcher \
                        --replace-miio \
                        --enable-addon-sox \
                        --enable-random-phrases \
                        --random-phrases-cron="*/2 * * * *" \
                        --enable-local-ota \
                        --resize-root-fs=522240 \
                        --custom-dropbear \
                        --diff \
                        -f "$1"
