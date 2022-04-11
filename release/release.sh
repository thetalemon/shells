git log | grep "#" | awk '{print $4}'

curl -fsSL -H "Authorization: token XXXXX" https://api.github.com/repos/thetalemon/manasblog/pulls?state=closed?since=2020-09-12T11:25:03Z | grep -e '"number":' -e '"title":'