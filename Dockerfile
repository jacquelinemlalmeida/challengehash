FROM ruby:2.6-slim-stretch

RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev

COPY Gemfile ./

RUN gem install bundler
RUN bundle install

RUN mkdir /project
WORKDIR /project

COPY . .

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]