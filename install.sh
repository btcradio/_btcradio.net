#All actions are performed in Terminal.app.
#
#1. Install Homebrew http://brew.sh/
#
#2. Install Jack (route audio tool) http://jackaudio.org/. Current stable version from official website doesn't work with
#MacOS Sierra (I use 10.12.3) so you need to download beta version from there https://yadi.sk/d/JwT10b7v3Dm5yy.
#After installing reboot your computer.
#
#3. Install Darkice (audio streamer) via brew.
#
#Run this command: brew install darkice --use-llvm
#
#Darkice will be installed with Jack 0.125.0 that doesn't work with used MacOS so we need to uninstall it,
#to continue using our Jack beta version.
#Run this command: brew uninstall --ignore-dependencies jack
#
#4. Install Icecast (web server for our radio station)
#
#Run this command: brew install icecast
#
#5. Download Icecast (https://yadi.sk/d/aq5OtdWJ3Dm5sb) and Darkice (https://yadi.sk/d/_WVtCjJE3Dm5ti) cfgs
#and put to the root folder (I will use commands for root folder in next steps) or any folder you want.
#
#6. Run Icecast with command: icecast -c ~/btcradio.net/icecast.xml
#To run it in background add -b key.
#
#If you get an error on this step "FATAL: could not open error logging" - open icecast.xml and change directory to your version
#from /usr/local/Cellar/icecast/icecast_current_version.
#
#7. Run JackPilot from Apps. Press Start.
#
#8. Run Darkice with command: darkice -c ~/.darkice.cfg
#To run it in background need to use screen.
#
#Go to http://localhost:8000/admin/ and enter the admin-user (admin) and admin-password (hackme) from the icecast.xml
#config file.
#You should arrive at the admin page.
#Suggest you to change user and password in both config files from default to prevent possible attacks.
#
#Your stream available via http://localhost:8000/spin
#
#9. To run radio separately from system sounds I prefer to use VLC player.
#Install and run VLC player, go to Audio - Audio Device - and choose JackRouter as audio output.
#Play music.
#For shuffling use VLC plugin https://addons.videolan.org/content/show.php/Shuffle+Playlist?content=174527
#
#10. Return to JackPilot, press Routing, Connection Manager opens.
#Here you'll see in/outs for your system.
#Now we need to bind VLC left and right channels to our Darkice server.
#Just press on VLC out1 and on darkice left, color should change to red.
#Do the same fro out2 and right channel.
#
#11. Open 8000 port in your router settings to get access outside your network.
#
#12. Enjoy your radio.
#
#!/usr/bin/env bash
#REF: https://www.virtualbox.org/wiki/Mac%20OS%20X%20build%20instructions
#REF: for manual building
checkbrew() {

    if hash brew 2>/dev/null; then
        # Make sure we’re using the latest Homebrew.
        brew update
        # Upgrade any already-installed formulae.
        brew upgrade
        #brew install jack # check for more current compatibility issues Mojave 10.14
        #brew install darkice # --use-llvm
        #brew uninstall --ignore-dependencies jack
        #brew install qjackctl
        brew install icecast
        icecast -b -c ~/btcradio.net/icecast.xml
        darkice -c ~/btcradio.net/darkice.cfg
        brew cask install vlcstreamer
        brew cask install vlc
        ln -s ~/btcradio.net/shuffle.lua /Applications/VLC.app/Contents/MacOS/share/lua/extensions/

    else
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
}

case $(uname | tr '[:upper:]' '[:lower:]') in
  linux*)
    export TRAVIS_OS_NAME=linux
    checkbrew
    ;;
  darwin*)
    export TRAVIS_OS_NAME=osx
    #curl -o Soundflower-2.0b2.dmg https://github.com/mattingalls/Soundflower/releases/download/2.0b2/Soundflower-2.0b2.dmg
    checkbrew
    ;;
  msys*)
    export TRAVIS_OS_NAME=windows
    echo "TODO:config auto windows config!"
    ;;
  *)
    export TRAVIS_OS_NAME=notset
    echo "TODO:handle other cases!"
    ;;
esac

# Remove outdated versions from the cellar.
brew cleanup
