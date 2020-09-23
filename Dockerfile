FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs


RUN mkdir /rakudiet
WORKDIR /rakudiet

COPY Gemfile /rakudiet/Gemfile
COPY Gemfile.lock /rakudiet/Gemfile.lock


RUN bundle install


COPY . /rakudiet


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]