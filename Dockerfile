FROM ruby:3.0.0-buster

EXPOSE 3000

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    nodejs

RUN npm install -g yarn

RUN mkdir /app

WORKDIR /app
COPY . /app
COPY Gemfile Gemfile.lock ./

ENV BUNDLER_VERSION 2.3.15
RUN gem update --system && gem install bundler:${BUNDLER_VERSION}
RUN bundle install
RUN yarn install

# Start the main process.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
