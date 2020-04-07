FROM nginx:1.17-alpine

LABEL maintainer = 'Alex Zaytseff <alex.zaytseff@gmail.com>'

ARG NGINX_REMOTE_PORT
COPY ./nginx.conf /etc/nginx/nginx.conf

RUN pattern="s/<nginx_remote_port>/${NGINX_REMOTE_PORT}/g" && sed -i -- "$pattern" /etc/nginx/nginx.conf
