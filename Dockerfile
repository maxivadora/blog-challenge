FROM ruby:3.0.0-buster

EXPOSE 3000

RUN mkdir /app

WORKDIR /app
COPY . /app
COPY Gemfile Gemfile.lock ./

ENV BUNDLER_VERSION 2.3.15
RUN gem update --system && gem install bundler:${BUNDLER_VERSION}
RUN bundle install

# Start the main process.
CMD ['bundle', 'exec', 'rails', 'server', '-b', '1.0.0.0', '-p', '3000']
