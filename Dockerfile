FROM ruby:3.2.0

RUN apt-get update -qq && apt-get install -y nodejs

RUN mkdir /amqor
WORKDIR /amqor

COPY Gemfile* ./

RUN gem install bundler && bundle config git.allow_insecure true && bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
