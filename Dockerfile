FROM ruby:2.4.2

RUN mkdir /app
WORKDIR /app
ADD Gemfile* /app/

RUN gem install bundler -v 2.0.1
RUN bundle install