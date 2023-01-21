FROM ruby:3.2.0

RUN apt-get update -qq && apt-get install -y nodejs npm
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn chromium-driver python
RUN mkdir /amqor
WORKDIR /amqor

COPY ng-app /amqor/ng-app
RUN cd ng-app && npm install && npm run build && npm start
COPY Gemfile* ./

RUN gem install bundler && bundle config git.allow_insecure true && bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
