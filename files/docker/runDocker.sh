#!/usr/bin/env bash

runDocker() {

    if hash brew 2>/dev/null; then
        # Make sure we’re using the latest Homebrew.
        brew update
        # Upgrade any already-installed formulae.
        brew upgrade

        #install brew libs
        brew install cask docker

        docker build -t icecast:1.0 .
        docker run -d -p 8000:8000 -t icecast:1.0



    else
        #example - execute remote script with perl
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        runDocker
    fi
}
runDocker
