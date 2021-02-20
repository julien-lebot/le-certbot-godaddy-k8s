FROM certbot/certbot:latest
RUN apk update && apk add bash curl
WORKDIR /Certbot-Godaddy
ADD Certbot-Godaddy .
ADD secret-patch-template.json /
RUN chmod +x ./*.sh
ENTRYPOINT [ "/bin/sh", "-c" ]
CMD ["./certbot-godaddy-request.sh"]