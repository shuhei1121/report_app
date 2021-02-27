FROM ruby:2.6.5

RUN apt-get update && apt-get install -y nodejs mariadb-client
WORKDIR /projects/report_app

COPY Gemfile /projects/report_app/Gemfile
COPY Gemfile.lock /projects/report_app/Gemfile.lock

RUN gem install bundler
RUN bundle install

COPY . /projects/report_app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]