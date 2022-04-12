source ./.env

# yyyy-MM-ddThh:mm:ssZ
SINCE_DATE=2021-09-12T11:25:03Z

curl -fsSL -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/thetalemon/manasblog/commits?since=$SINCE_DATE | grep '"message":' | grep '#' | awk '{print "- " $5}'
echo "---"

curl -fsSL -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/thetalemon/manasblog/pulls?state=closed?since=$SINCE_DATE | grep -e '"number":' -e '"title":' | sed -e 's/,//g' | sed -e 's/"//g' | awk '{if(NR%2)ORS=": ";else ORS="\n";print $2}' | awk '{print "- " $0}'