FROM ruby:2.4.0

ENV LANG C.UTF-8

MAINTAINER LolDesign <contato@loldesign.com.br>

RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev libqt4-webkit libqt4-dev xvfb postgresql-client-9.4 imagemagick --fix-missing --no-install-recommends

ENV INSTALL_PATH /wingle
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5
COPY . .

VOLUME ["$INSTALL_PATH/public"]
CMD bundle exec puma
