FROM ruby:2.7.1-alpine3.12

ENV LANG C.UTF-8
RUN apk upgrade && \
    apk add --no-cache \
    bash \
    build-base \
    curl-dev \
    git \
    graphviz \
    imagemagick \
    imagemagick-dev \
    less \
    libxml2-dev \
    libxslt-dev \
    mysql-client \
    mysql-dev \
    nodejs \
    npm \
    openssl \
    readline \
    readline-dev \
    tar \
    ttf-freefont \
    tzdata \
    udev \
    wget \
    yaml \
    yaml-dev\
    yarn \
    zlib \
    zlib-dev

RUN gem install bundler
RUN gem update

WORKDIR /var/www/backend

COPY ./Gemfile .
COPY ./Gemfile.lock .

RUN bundle install

COPY . .

RUN yarn
# assets precompileがエラーになるので環境変数を指定しつつ実行
RUN RAILS_ENV=production \
    RUN_ASSETS_COMPILE=true \
    SECRET_KEY_BASE=dummy \
    RAILS_MASTER_KEY=dummy \
    API_SERVER_DATABASE_HOST=dummy \
    API_SERVER_DATABASE_NAME=dummy \
    API_SERVER_DATABASE_USER=dummy \
    API_SERVER_DATABASE_PASSWORD=dummy \
    BULLET_SLACK_WEBHOOK_URL=dummy \
    bundle exec rails assets:precompile

COPY ./services.sh /var/www/scripts/
RUN chmod +x /var/www/scripts/services.sh

CMD ["/var/www/scripts/services.sh"]

