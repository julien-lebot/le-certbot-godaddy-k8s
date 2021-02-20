FROM certbot/certbot:latest
RUN apk update && apk add bash curl
WORKDIR /Certbot-Godaddy
ADD Certbot-Godaddy .
ENTRYPOINT [ "/bin/bash" ]
CMD certbot-godaddy-request.sh