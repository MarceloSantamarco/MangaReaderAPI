FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y build-essential
RUN gem install bundler

RUN mkdir /MangaReader
WORKDIR /MangaReader

COPY Gemfile /MangaReader/Gemfile
COPY Gemfile.lock /MangaReader/Gemfile.lock

RUN bundle install

COPY . /MangaReader

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]