# Whitelist sites
#cat > /tmp/whitelist <<EOF
#EOF

if [ ! -s /tmp/dlhosts ] ; then

echo -e "#!/bin/sh\n(wget -O - http://winhelp2002.mvps.org/hosts.txt ; wget -O - http://jamesisbored.com/iphone/content/hosts.php ; wget -O - http://adaway.org/hosts.txt ; wget -O - http://www.malwaredomainlist.com/hostslist/hosts.txt ; wget -O - http://www.mvps.org/winhelp2002/hosts.txt ; wget -O - 'http://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&startdate%5Bday%5D=&startdate%5Bmonth%5D=&star') | grep .0.0. | grep -Fvf /tmp/whitelist | sed -e '2,\$s/127.0.0.1/0.0.0.0/g' -e 's/[[:space:]]*#.*$//' > /etc/dnsmasq/hosts/blkhosts\nlogger 'DOWNLOADED ADBLOCK HOSTS FILE(s)'\nkillall -1 dnsmasq" > /tmp/dlhosts
chmod 777 /tmp/dlhosts
sleep 120
/tmp/dlhosts
fi
cru a Gethosts "00 4 * * 3 /tmp/dlhosts"
