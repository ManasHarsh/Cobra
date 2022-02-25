#!/usr/bin/env bash
#Installer Script for Assets [@author: amanjha22@gmail.com]

scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. "$scriptDir/helper.sh" # import required utility functions

if [ -f /.dockerenv ]; then
    sudoo=""
else
    sudoo="sudo"
fi

function setupEnvironment(){
    log "checking your system and setting up the environment: "
    eval $(echo "$sudoo apt update;")    

    log "setting gopath";
    if [ -f ~/.bashrc ]; then
        echo "export GOPATH=\$HOME/go" >> ~/.bashrc
        echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc
        source ~/.bashrc;
    elif [ -f ~/.zshrc ]; then
        echo "export GOPATH=\$HOME/go" >> ~/.zshrc
        echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.zshrc
        source ~/.zshrc;
    fi

    log "Installing golang"
    eval $(echo "$sudoo apt install -y golang;")

    log "Installing Python3/pip3"
    eval $(echo "$sudoo apt install -y python3;")
    eval $(echo "$sudoo apt install -y python3-pip;")

    log "Installing git"
    eval $(echo "$sudoo apt install -y git;")

    log "Installing libcap-dev"
    eval $(echo "$sudoo apt install -y libpcap-dev;")
}

function setupAssets(){
    log "Installing your assets, please wait :)"
    downloadGitProjects
    installGoModules
    installArjun
    installFindDomain
    installSubListr
    installAquatone
    installWebScreenshot
}

function downloadGitProjects(){  
    cd  $scriptDir
    git clone https://github.com/GerbenJavado/LinkFinder;
    git clone https://github.com/devanshbatham/ParamSpider;
    git clone https://github.com/m4ll0k/SecretFinder;
    git clone https://github.com/projectdiscovery/nuclei-templates;
    git clone https://github.com/maurosoria/dirsearch
    git clone https://github.com/s0md3v/Corsy.git;
    git clone https://github.com/hisxo/gitGraber.git;
    git clone https://github.com/lobuhi/byp4xx.git;
}

function installGoModules(){
    go get github.com/hakluke/hakrawler;
    go get github.com/tomnomnom/hacks/waybackurls;

    GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder;

    GO111MODULE=on go get -v github.com/projectdiscovery/dnsx/cmd/dnsx
    GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei;
    GO111MODULE=on go get -v github.com/hahwul/dalfox/v2;
    go get github.com/haccer/subjack;
    GO111MODULE=on go get -u -v github.com/lc/gau;
    GO111MODULE=on go get -v github.com/OWASP/Amass/v3/...
    go get -u github.com/ffuf/ffuf;
    GO111MODULE=on go get -v github.com/projectdiscovery/naabu/v2/cmd/naabu
    GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx;
}

function installArjun(){
    cd  $scriptDir
    git clone https://github.com/s0md3v/Arjun; 
    cd  $scriptDir/Arjun
    eval $(echo "$sudoo python3 setup.py install;")
}

function installFindDomain(){
    cd $scriptDir
    eval $(echo "$sudoo apt install -y cargo;")
    git clone https://github.com/findomain/findomain.git;
    cd $scriptDir/findomain
    cargo build --release;
    cp target/release/findomain ~/go/bin/
}

function installSubListr(){
    cd $scriptDir
    git clone https://github.com/aboul3la/Sublist3r.git
    cd Sublist3r
    pip3 install -r requirements.txt
    eval $(echo "$sudoo python3 setup.py install")
}

function installAquatone(){
    cd $scriptDir;
    wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip;
    unzip $scriptDir/aquatone_linux_amd64_1.7.0.zip;
    cp $scriptDir/aquatone ~/go/bin/;
}

function installWebScreenshot(){
    cd $scriptDir;
    git clone https://github.com/maaaaz/webscreenshot.git;
    cd $scriptDir/webscreenshot;
    eval $(echo "$sudoo pip3 install -r requirements.txt;")
    cd $scriptDir; 
}