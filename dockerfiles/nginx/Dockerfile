FROM nginx:1.17.5

RUN apt-get update && \
    apt-get install -y nodejs npm curl && \
    npm install -g n && \
    PATH="/usr/local/bin:$PATH" && \
    n 12.16.3 && \
    node -v && \
    npm -v && \
    npm install -g yarn && \
    yarn --version

WORKDIR /var/www/front

COPY ./docker/nginx/conf.d/default.conf /etc/nginx/conf.d/

