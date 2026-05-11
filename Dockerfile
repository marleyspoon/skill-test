# syntax=docker/dockerfile:1

ARG RUBY_VERSION=3.3.6
FROM docker.io/library/ruby:${RUBY_VERSION}-slim-bookworm

WORKDIR /app

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    curl \
    libsqlite3-0 \
    libsqlite3-dev \
    pkg-config && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives

ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_WITHOUT="development:test"

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN chmod +x bin/docker-entrypoint && \
    SECRET_KEY_BASE=precompile_placeholder_key_do_not_use_in_production \
    ./bin/rails assets:precompile

EXPOSE 3000

ENTRYPOINT ["/app/bin/docker-entrypoint"]
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
