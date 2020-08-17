FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /tensakun
WORKDIR /tensakun

COPY Gemfile /tensakun/Gemfile
COPY Gemfile.lock /tensakun/Gemfile.lock

RUN gem install bundler
RUN bundle install
COPY . /tensakun