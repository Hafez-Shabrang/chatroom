FROM ruby:3.2.0

WORKDIR /chatroom

RUN apt-get update && apt-get install -y nodejs sqlite3

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && gem install rails

COPY . .

RUN bundle install

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

