FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY ./compose/nginx/nginx.conf /etc/nginx/conf.d
COPY ./compose/nginx/ssl /etc/ssl
