#!/usr/bin/env bash

setup() {

    if hash brew 2>/dev/null; then
        # Make sure we’re using the latest Homebrew.
        brew update
        # Upgrade any already-installed formulae.
        brew upgrade

        #install brew libs
        brew cask install docker
        brew link --overwrite docker
        ls -l /usr/local/bin/docker*
        open /Applications/Docker.app

    else

        #example - execute script with perl
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        installDocker

    fi
}
setup

#sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev
#sudo apt install ruby-dev ruby-bundler nodejs
gem install nokogiri
#bundle clean
bundle install
bundle exec jekyll liveserve
