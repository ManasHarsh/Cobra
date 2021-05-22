
echo "                          ____ ___  ____  ____      _  "  
echo "                         / ___/ _ \| __ )|  _ \    / \ "  
echo "                        | |  | | | |  _ \| |_) |  / _ \  "
echo "                        | |__| |_| | |_) |  _ <  / ___ \ "
echo "                         \____\___/|____/|_| \_\/_/   \_\ "
echo "                       Made with <3 and sweat by ManasH4rsh  "
echo " 								"

echo	" 1.  subfinder             2. dnsx      			    3.  nuclei		"	
echo	" 4.  httpx       			5. waybackurls            	6.  getallurls(gau)					"
echo	" 7.  naabu   				8. aquatone               	9.  hakrawler						"
echo	" 10. FFUF "
echo -n "Enter the respective number from tool list that you want to use: "
read number
echo ""

case $number in
	1)
		echo -n "Enter the domain: "
		read domain
             	subfinder -d $domain -o output.txt
		;;

	2)
		echo -n "Enter the domain: "
		read domain
             	subfinder -d $domain | dnsx -cname -resp
		;;
          
        3)
		echo -n "Enter the domain: "
		read domain
             	echo "$domain" | nuclei -t nuclei-templates -o $domain.txt
		;;
	
	4)
		echo -n "Enter the domain: "
		read domain
             	echo "$domain" | httpx -silent
		;;

	5)
		echo -n "Enter the domain: "
		read domain
             	echo "$domain" | waybackurls > $domain.txt
		;;

	6)
		echo -n "Enter the domain: "
		read domain
             	gau -o $domain.txt $domain
		;;

	7)
		echo -n "Enter the domain: "
		read domain
             	naabu -host $domain
		;;

	8)
		echo -n "Enter the domain: "
		read domain
             	echo "$domain" | aquatone
		;;

	9)
		echo -n "Enter the domain: "
		read domain
             	hakrawler -url $domain -depth 1
		;;

	10)
		echo -n "Enter the domain: "
		read domain
             	ffuf -w /path/to/wordlist -u https://$domain/FUZZ
		;;

	*)
		echo "Please give valid choice!!!"
		;;

esac