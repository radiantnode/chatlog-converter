FROM ruby:2.6.3-alpine AS base

WORKDIR /srv/chatlogs-converter

COPY Gemfile* ./

RUN apk add --update ruby-dev build-base && \
    bundle install

FROM base

COPY . .

CMD ["bin/convert"]
