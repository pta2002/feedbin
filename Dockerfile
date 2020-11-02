FROM ruby:2.6
WORKDIR /usr/src
RUN apt-get update && \
    apt-get install libldap-2.4.2 \
                    libidn11-dev \
                    dnsutils \
                    postgresql-client -y && \
    gem install idn-ruby -v '0.1.0' && \
    gem install bundler

COPY Gemfile Gemfile.lock /usr/src/
RUN bundle install
COPY . /usr/src/

CMD ["/bin/bash", "startup_script.sh"]

