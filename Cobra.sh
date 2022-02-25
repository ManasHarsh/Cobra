#!/usr/bin/env bash
#Installer Script for Assets [@author: amanjha22@gmail.com]

scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. "$scriptDir/banner.sh" # import banner
. "$scriptDir/setup.sh" # import setup script

if [ -f $scriptDir/.installed ]; then
    log ".installed file found";
    log "Expecting things to be already present"
else
    log "Things might not be installed"
    log "Will Setup Environment and install assets"
    setupEnvironment
    abort_on_failure "Failed to setup Environment"
    setupAssets  
    abort_on_failure "Failed to Setup Assets"
    touch $scriptDir/.installed

fi

. "$scriptDir/tools.sh" # run the tooling script
