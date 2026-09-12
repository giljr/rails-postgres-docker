FROM ruby:3.4-bookworm

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        gcc \
        g++ \
        make \
        libc6-dev \
        libpq-dev \
        libyaml-dev \
        pkg-config \
        nodejs \
        npm && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN gem update --system && \
    gem install bundler

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
