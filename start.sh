#!/bin/bash
# تشغيل Shadowsocks
ss-server -c /app/config.json &
# تشغيل stunnel
stunnel /app/stunnel.conf
