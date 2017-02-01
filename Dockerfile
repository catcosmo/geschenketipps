FROM ruby:2.3-slim
MAINTAINER Aaron Alexander Israel <aaron.israel@cedis.fu-berlin.de>

RUN echo "# Generate locales" && \
    echo "# Upgrade apt" && \
    sed -i 's/main$/main contrib/g' /etc/apt/sources.list && \
    sed -i 's/httpredir.debian.org/debian.tu-bs.de/g' /etc/apt/sources.list && \
    apt-get update && apt-get upgrade -y && \
    echo "# Install common dev dependencies via apt" && \
    apt-get install -y \
    file git curl wget rsync patch build-essential \
    graphviz graphviz-dev libgraphviz-dev \
    imagemagick libmagickwand-dev libfreetype6-dev libfreetype6 libfontconfig \
    openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev mysql-client libmysqld-dev libxml2-dev libxslt-dev libc6-dev \
    vim libmysqlclient-dev bzip2 nodejs npm --fix-missing --no-install-recommends&& \
    gem install bundler && \
    ln -s /usr/bin/nodejs /usr/local/bin/node && \
    ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    apt-get clean && \
    npm install -g bower

ENV APP_HOME /presentsdb
RUN mkdir -p $APP_HOME

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . $APP_HOME
WORKDIR $APP_HOME

RUN RAILS_ENV=production bundle exec rake assets:precompile --trace

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
    BUNDLE_JOBS=4 \
    BUNDLE_PATH=/bundle

RUN bundle install --binstubs --jobs 4

VOLUME ["$APP_HOME/public"]
EXPOSE 3000

# ENTRYPOINT RUNS ALWAYS BEFORE CMD
# ENTRYPOINT ["./bin/puma", "-C", "./config/puma.rb"]

# CMD works more like a default
CMD ["./bin/puma", "-C", "./config/puma.rb"]
