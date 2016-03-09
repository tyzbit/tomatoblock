# Whitelist sites
cat > /tmp/whitelist <<EOF
EOF

cat > /tmp/blacklist <<EOF
0.0.0.0 p2pcamweb.tutk.com
0.0.0.0 tutk.com
0.0.0.0 www.tutk.com
0.0.0.0 ac3.msn.com
0.0.0.0 choice.microsoft.com
0.0.0.0 choice.microsoft.com.nsatc.net
0.0.0.0 compatexchange.cloudapp.net
0.0.0.0 corp.sts.microsoft.com
0.0.0.0 corpext.msitadfs.glbdns2.microsoft.com
0.0.0.0 cs1.wpc.v0cdn.net
0.0.0.0 diagnostics.support.microsoft.com
0.0.0.0 feedback.search.microsoft.com
0.0.0.0 feedback.windows.com
0.0.0.0 i1.services.social.microsoft.com
0.0.0.0 i1.services.social.microsoft.com.nsatc.net
0.0.0.0 oca.telemetry.microsoft.com
0.0.0.0 oca.telemetry.microsoft.com.nsatc.net
0.0.0.0 pre.footprintpredict.com
0.0.0.0 redir.metaservices.microsoft.com
0.0.0.0 services.wes.df.telemetry.microsoft.com
0.0.0.0 settings-sandbox.data.microsoft.com
0.0.0.0 sls.update.microsoft.com.akadns.net
0.0.0.0 sqm.df.telemetry.microsoft.com
0.0.0.0 sqm.telemetry.microsoft.com
0.0.0.0 sqm.telemetry.microsoft.com.nsatc.net
0.0.0.0 ssw.live.com
0.0.0.0 statsfe1.ws.microsoft.com
0.0.0.0 statsfe2.update.microsoft.com.akadns.net
0.0.0.0 survey.watson.microsoft.com
0.0.0.0 telecommand.telemetry.microsoft.com
0.0.0.0 telecommand.telemetry.microsoft.com.nsatc.net
0.0.0.0 telemetry.urs.microsoft.com
0.0.0.0 vortex-bn2.metron.live.com.nsatc.net
0.0.0.0 vortex-cy2.metron.live.com.nsatc.net
0.0.0.0 vortex-sandbox.data.microsoft.com
0.0.0.0 vortex-win.data.microsoft.com
0.0.0.0 vortex.data.microsoft.com
0.0.0.0 watson.live.com
0.0.0.0 watson.microsoft.com
0.0.0.0 watson.ppe.telemetry.microsoft.com
0.0.0.0 watson.telemetry.microsoft.com
0.0.0.0 watson.telemetry.microsoft.com.nsatc.net
EOF

if [ ! -s /tmp/dlhosts ] ; then

echo -e "#!/bin/sh\n(wget -O - https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts; wget -O - http://jamesisbored.com/iphone/content/hosts.php; cat /tmp/blacklist) | grep .0.0. | grep -Fvf /tmp/whitelist | sed -e '2,\$s/127.0.0.1/0.0.0.0/g' -e 's/[[:space:]]*#.*$//' > /etc/dnsmasq/hosts/blkhosts\nlogger 'DOWNLOADED ADBLOCK HOSTS FILE(s)'\nkillall -1 dnsmasq" > /tmp/dlhosts
chmod 777 /tmp/dlhosts
sleep 120
/tmp/dlhosts
fi
cru a Gethosts "00 4 * * 3 /tmp/dlhosts"