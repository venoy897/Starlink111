FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    shadowsocks-libev \
    stunnel4 \
    openssl \
    && apt-get clean

# نسخ الملفات إلى الحاوية
COPY config.json /app/config.json
COPY stunnel.conf /app/stunnel.conf
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# إنشاء شهادة TLS self-signed
RUN openssl req -new -x509 -days 365 -nodes \
    -out /etc/stunnel/stunnel.pem \
    -keyout /etc/stunnel/stunnel.pem \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Org/CN=free.facebook.com"

EXPOSE 443 8388

CMD ["/app/start.sh"]
