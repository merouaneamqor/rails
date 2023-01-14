FROM ruby:2.7.0

RUN apt-get update -qq && apt-get install -y nodejs sqlite3

RUN mkdir /amqor
WORKDIR /amqor

COPY Gemfile* ./
RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
