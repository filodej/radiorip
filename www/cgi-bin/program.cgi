#!/bin/sh
FILTERS=12,25
SCHEDULE=
REDIR_BASE=/radiorip/cgi-bin/list.cgi
 
#echo -n -e "HTTP/1.0 302 Moved Temporarily\r\n"
echo -n -e "Status: 302\r\n"
echo -n -e "Location: ${REDIR_BASE}?filters=${FILTERS}&schedule=${SCHEDULE}\r\n"
echo -n -e "\r\n"
