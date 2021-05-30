
echo "                          ____ ___  ____  ____      _  "  
echo "                         / ___/ _ \| __ )|  _ \    / \ "  
echo "                        | |  | | | |  _ \| |_) |  / _ \  "
echo "                        | |__| |_| | |_) |  _ <  / ___ \ "
echo "                         \____\___/|____/|_| \_\/_/   \_\ "
echo "                       Made with <3 and sweat by ManasH4rsh   "
echo " 								"

echo	" 1.  subfinder		2. dnsx				3.  nuclei		"	
echo	" 4.  httpx       	5. waybackurls            	6.  getallurls					"
echo	" 7.  naabu   		8. aquatone               	9.  hakrawler						"
echo	" 10. FFUF	 	11. dirsearch			12. amass "
echo	" 13. dalfox		14. findomain			15. arjun"
echo	" 16. LinkFinder		17. secretfinder		18. ParamSpider"
echo	" 19. Corsy 		20. gitgraber 			21. byp4xx"
echo	" 22. Subjack "
echo	""

conl = true

while [ $conl ]:
do

echo -n "Enter the respective number from tool list that you want to use: "
read number
echo ""


if [[ $number -lt 21 ]]
		echo -n "Enter the domain: "
		read domain
fi
		

case $number in


	1)

             	subfinder -d $domain -o output.txt
		;;

	2)

             	subfinder -d $domain | dnsx -cname -resp
		;;
          
	3)

             	echo "$domain" | nuclei -t nuclei-templates -o $domain.txt
		;;
	
	4)

             	echo "$domain" | httpx -silent
		;;

	5)

             	echo "$domain" | waybackurls > $domain.txt
		;;

	6)

             	gau -o $domain.txt $domain
		;;

	7)

             	naabu -host $domain
		;;

	8)

             	echo "$domain" | aquatone
		;;

	9)

              	hakrawler -url $domain -depth 1
		;;

	10)

             	ffuf -w /usr/share/wordlists/rockyou.txt -u https://$domain/FUZZ
		;;
	11)

		python3 ~/dirsearch/dirsearch.py -u $domain -e all
		;;
	
	12)

		amass intel -d $domain -whois -o output.txt
		;;

	13)

		dalfox url http://$domain -b hahwul.xss.ht
		;;

	14)

		findomain -t $domain -o
		;;

	15)

		arjun -u https://$domain
		;;


	16)

		python3 ~/LinkFInder/linkfinder.py -i https://$domain -d 
		;;

	17)

		python3 ~/secretfinder/SecretFinder.py -i $domain -o output.html
		;;

	18)

		python3 ~/ParamSpider/paramspider.py --domain $domain
		;;

	19)

		python3 ~/Corsy/corsy.py -u https://$domain
		;;

	
	20)

		python3 ~/gitGraber/gitGraber.py -k keywordsfile.txt \"$domain\" -s
		;;

	21)
		echo -n "Enter the URL: "
		read  url
		~/byp4xx/./byp4xx.sh $url
		;;
		
	22) 
	
        	echo -n "Enter your file: "
		read  file
		./subjack -w $file -t 100 -timeout 30 -o results.txt -ssl
		;;

	*)	
		$conl = false
		echo "Please give valid choice!!!"
		;;

esac
done
