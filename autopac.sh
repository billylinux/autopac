#!/bin/bash

GFWLIST="https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt"
PROXY="127.0.0.1:1080"
USER_RULE_NAME="user_rule.txt"

echo "downloading gfwlist from $GFWLIST"
curl -# "$GFWLIST" -f --socks5-hostname "$PROXY" > /tmp/gfwlist.txt

if [[ $? -ne 0 ]]; then
	echo "abort due to error occurred!"
	exit 1
fi

cd `dirname "${BASH_SOURCE[0]}"`

if [ -f "blacklist.pac" ]; then
	mv blacklist.pac blacklist.pac.bak
fi

if [ ! -f $USER_RULE_NAME ]; then
	touch $USER_RULE_NAME
fi

/usr/local/bin/gfwlist2pac \
    --input /tmp/gfwlist.txt \
    --file blacklist.pac \
    --proxy "SOCKS5 $PROXY; SOCKS $PROXY; DIRECT" \
    --user-rule $USER_RULE_NAME #\
    #--precise

rm -f /tmp/gfwlist.txt
echo "update blacklist.pac done!"