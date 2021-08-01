
echo "                          ____ ___  ____  ____      _  "  
echo "                         / ___/ _ \| __ )|  _ \    / \ "  
echo "                        | |  | | | |  _ \| |_) |  / _ \  "
echo "                        | |__| |_| | |_) |  _ <  / ___ \ "
echo "                         \____\___/|____/|_| \_\/_/   \_\ "
echo "                       Made with <3 and sweat by ManasH4rsh   "
echo " 								"
echo ""
echo "checking your system and setting up the environment: "
echo ""
sudo apt install -y golang;
sudo apt install -y python3;
sudo apt install -y python3-pip;
sudo apt install -y git;
echo "installing your assets, please wait:)"
echo ""

git clone https://github.com/GerbenJavado/LinkFinder;
git clone https://github.com/s0md3v/Arjun; 
git clone https://github.com/m4ll0k/SecretFinder;
git clone https://github.com/devanshbatham/ParamSpider;
go get github.com/hakluke/hakrawler;
GO111MODULE=on go get -u -v github.com/hahwul/dalfox;
go get github.com/tomnomnom/hacks/waybackurls;
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder;
GO111MODULE=on go get -v github.com/projectdiscovery/dnsx/cmd/dnsx
GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei;
git clone https://github.com/projectdiscovery/nuclei-templates;
go get github.com/haccer/subjack;
git clone https://github.com/findomain/findomain.git;
GO111MODULE=on go get -u -v github.com/lc/gau;
GO111MODULE=on go get -u -v github.com/hahwul/dalfox;
GO111MODULE=on go get -v -u github.com/OWASP/Amass/v3/...
git clone https://github.com/maurosoria/dirsearch
git clone https://github.com/s0md3v/Corsy.git;
go get -u github.com/ffuf/ffuf;
sudo apt install -y libpcap-dev;
GO111MODULE=on go get -v github.com/projectdiscovery/naabu/v2/cmd/naabu
GO111MODULE=on go get -u -v github.com/projectdiscovery/httpx/cmd/httpx;
git clone https://github.com/hisxo/gitGraber.git;
git clone https://github.com/lobuhi/byp4xx.git;

git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
pip3 install -r requirements.txt
sudo python3 setup.py install

cd ~/Arjun
sudo python3 setup.py install

cp -r ~/go/bin/* /usr/local/bin 

