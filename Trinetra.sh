#!/bin/bash
# instagram: @IndianCyberTroops
clear
N='\033[0m'
R='\033[0;31m'
G='\033[0;32m'
O='\033[0;33m'
B='\033[0;34m'
Y='\033[0;38m'       # Yellow
C='\033[0;36m'         # Cyan
W='\033[0;37m'        # White
trap 'printf "\e[1;77m \n Ctrl+C was pressed, exiting...\n\n \e[0m"; rm -rf ict.url*; exit 0' 2
counter=0
turn=0
default_crawl="0"
default_Requests="10"

function banner() {
	
	echo -e "
	
${N}████████╗██████╗ ██╗███╗   ██╗███████╗████████╗██████╗  █████╗ 
${R}╚══██╔══╝██╔══██╗██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██╔══██╗
${G}   ██║   ██████╔╝██║██╔██╗ ██║█████╗     ██║   ██████╔╝███████║
${O}   ██║   ██╔══██╗██║██║╚██╗██║██╔══╝     ██║   ██╔══██╗██╔══██║
${B}   ██║   ██║  ██║██║██║ ╚████║███████╗   ██║   ██║  ██║██║  ██║
${C}   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝
                    ${C}A Tool By Indian Cyber Troops
                          ${Y} Author:Krishanu Sharma                                           

${W}Look Web With Third Eye And Get Url From Web 
${Y}A New Way To Gain Information In New Era
       ${B}Github:https://github.com/indiancybertroops 
       ${O}Instagram:instagram.com/indiancybertroops
                                       "

}
banner
read -p $'\e[1;77mSite to Crawl: \e[0m' site
read -p $'\e[1;77mCrawler Depth (Default '$default_crawl'): ' crawl
crawl="${crawl:-${default_crawl}}"
read -p $'\e[1;77mRequests (Default '$default_Requests'): ' Requests
Requests="${Requests:-${default_Requests}}"

printf "\e[43m${B}[*] $0 is \e[5mFinding URl \e[25m, please wait... \e[0m \n"
start="$(date -u +%s)"
wget --no-check-certificate -q $site -O - | tr "\t\r\n'" '   "' | grep -i -o '<a[^>]\+href[ ]*=[ \t]*"\(ht\|f\)tps\?:[^"]\+"' | sed -e 's/^.*"\([^"]\+\)".*$/\1/g' > ict.url.$turn
let counter++

function spider() {
let turn++
cat ict.url.$((turn-1)) | xargs -P $Requests -I % wget --no-check-certificate -q % -O - | tr "\t\r\n'" '   "' | grep -i -o '<a[^>]\+href[ ]*=[ \t]*"\(ht\|f\)tps\?:[^"]\+"' | sed -e 's/^.*"\([^"]\+\)".*$/\1/g' >> ict.url.$turn
}
clear
function banner() {
	
	echo -e "
	
${N}████████╗██████╗ ██╗███╗   ██╗███████╗████████╗██████╗  █████╗ 
${R}╚══██╔══╝██╔══██╗██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██╔══██╗
${G}   ██║   ██████╔╝██║██╔██╗ ██║█████╗     ██║   ██████╔╝███████║
${O}   ██║   ██╔══██╗██║██║╚██╗██║██╔══╝     ██║   ██╔══██╗██╔══██║
${B}   ██║   ██║  ██║██║██║ ╚████║███████╗   ██║   ██║  ██║██║  ██║
${C}   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝
                                                               

${W}Look Web With Third Eye And Get Url From Web 
${Y}A New Way To Gain Information In New Era
${C}A Tool By Indian Cyber Troops
${Y}Author:Krishanu Sharma
${B}Github:https://github.com/indiancybertroops 
${O}Instagram:https://instagram.com/indiancybertroops "

}
banner
echo -e "============================================================"
while [[ "$crawl" -gt "$counter" ]]; do
  ict
  let counter++
done
end="$(date -u +%s)"
duration="$(($end-$start))"
cat ict.url* | uniq > result.txt
rm -rf ict.url*
printf "\e[1;77m\nLinks found: $(wc -l result.txt | tr -cd [:digit:]) \e[0m \n" 
printf "\e[1;77mSaved on: result.txt \e[0m \n"
printf "\e[1;77mTime Elapsed: $duration seconds \e[0m \n"

# show results
echo " "
cat result.txt
