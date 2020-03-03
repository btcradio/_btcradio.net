#!/usr/bin/env bash

sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev
sudo apt install ruby-dev ruby-bundler nodejs
gem install nokogiri
#bundle clean
bundle install
bundle exec jekyll liveserve
