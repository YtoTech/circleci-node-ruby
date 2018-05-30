# A Node and Ruby Docker image for CircleCI

A [Docker image](https://hub.docker.com/r/yoant/circleci-node-ruby/) including both Node and Ruby for a CircleCI runner. So you can
build your mixed Node and Ruby projects (Jekyll, Node with Sass, and so on).

The image is based on the pre-built CircleCI [lastest Node image](https://circleci.com/docs/2.0/circleci-images/#nodejs).

We simply add [Ruby](https://rubygems.org) and [Bundler](http://bundler.io/) on top of it.

## Usage Example

You can then use the image in your CircleCI v2 configuration file `.circleci//config.yml`:

```
# Javascript Node CircleCI 2.0 configuration file
#
# Check https://circleci.com/docs/2.0/language-javascript/ for more details
#
version: 2
jobs:
  build:
    docker:
      - image: yoant/circleci-node-ruby

    working_directory: ~/repo

    steps:
      - checkout

      # Download and cache dependencies
      - restore_cache:
          keys:
          - v1-dependencies-{{ checksum "package.json" }}
          # fallback to using the latest cache if no exact match is found
          - v1-dependencies-

      - run: yarn install

      - save_cache:
          paths:
            - node_modules
          key: v1-dependencies-{{ checksum "package.json" }}

      # Install Sass
      - run: bundler install

      # Build the project with Node and Sass.
      - run: yarn run build

      # run tests!
      - run: yarn test
      
      [...]
```

## Credits & Contributions

Image by Yoan Tournade <yoan@ytotech.com>. Reach out or [open issues](https://github.com/YtoTech/circleci-node-ruby/issues) or PR to make it better!

Y
