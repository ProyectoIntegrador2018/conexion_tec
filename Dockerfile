# I: Runtime Stage: ============================================================
# This is the stage where we build the runtime base image, which is used as the
# common ancestor by the rest of the stages, and contains the minimal runtime
# dependencies required for the application to run:

# Step 1: Use the official Ruby 2.6.3 Slim Strech image as base:
FROM ruby:2.6.3-slim-stretch AS runtime

# Step 2: We'll set the MALLOC_ARENA_MAX for optimization purposes & prevent memory bloat
# https://www.speedshop.co/2017/12/04/malloc-doubles-ruby-memory.html
ENV MALLOC_ARENA_MAX="2"

# Step 3: We'll set '/usr/src' path as the working directory:
# NOTE: This is a Linux "standard" practice - see:
# - http://www.pathname.com/fhs/2.2/
# - http://www.pathname.com/fhs/2.2/fhs-4.1.html
# - http://www.pathname.com/fhs/2.2/fhs-4.12.html
WORKDIR /usr/src

# Step 4: We'll set the working dir as HOME and add the app's binaries path to
# $PATH:
ENV HOME=/usr/src PATH=/usr/src/bin:$PATH


# Step 5: We'll install curl for later dependencies installations
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl


# Step 6: Add nodejs source
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

# Step 7: Add yarn packages repository
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Step 8: Install the common runtime dependencies:

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    apt-transport-https software-properties-common \
    ca-certificates \
    openssl \
    nodejs \
    tzdata && \
    rm -rf /var/lib/apt/lists/*

# II: Development Stage: =======================================================
# In this stage we'll build the image used for development, including compilers,
# and development libraries. This is also a first step for building a releasable
# Docker image:


# Step 9: Start off from the "runtime" stage:
FROM runtime AS development

# Step 10: Install the development dependency packages with debian package

# manager:
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    git \
    graphviz \
    default-libmysqlclient-dev && \
    #MYSQL lib dev libpq-dev && \
    rm -rf /var/lib/apt/lists/*


# Step 11: Copy the project's Gemfile + lock:
ADD Gemfile* /usr/src/

# Step 12: Install bundler ~> 2.0
RUN gem install bundler -v 2.0.1

# Step 13: Install the current project gems - they can be safely changed later
# during development via `bundle install` or `bundle update`:
RUN bundle install --jobs=4 --retry=3

# Step 14: Set the default command:
CMD [ "rails", "server", "-b", "0.0.0.0" ]

# Step 15: Copy the rest of the code

ADD . /usr/src