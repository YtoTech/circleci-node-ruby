# Based on the pre-built CircleCI Node image.
# See https://circleci.com/docs/2.0/circleci-images/#nodejs
FROM circleci/node:latest
LABEL maintainer="yoan@ytotech.com"

# Add Ruby.
# TODO Do we need ruby-full?
RUN sudo apt-get update \
	&& sudo apt-get install -y \
		ruby \
	&& sudo rm -rf /var/lib/apt/lists/*

# Install Bundler.
RUN sudo gem install bundler

# Also pre-install Sass?
