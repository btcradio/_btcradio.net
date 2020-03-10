#!/usr/bin/env bash

setup() {

    if hash brew 2>/dev/null; then
        # Make sure we’re using the latest Homebrew.
        brew update
        # Upgrade any already-installed formulae.
        brew upgrade

        #install brew libs
	brew cask install spotify
        brew install id3v2
	brew install lame
        brew install node
        #brew install bundle
	brew install bundler-completion

        brew install coreutils #gshuf
        #  PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
        brew cask install docker
        #brew link --overwrite docker
        #ls -l /usr/local/bin/docker*
        #open /Applications/Docker.app

    else

        #example - execute script with perl
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        setup

    fi
}
setup

#sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev
#sudo apt install ruby-dev ruby-bundler nodejs
gem install bundler
gem install nokogiri

#gem install commonmarker -v '0.17.13' --source 'https://rubygems.org/'
bundle clean --force
bundle install

bundle exec jekyll serve
