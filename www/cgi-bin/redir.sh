#!/bin/sh
echo -n -e "HTTP/1.0 302 Moved Temporarily\r\n"
echo -n -e "Location: /cgi-bin/list.sh?filters=12,25\r\n"
echo -n -e "\r\n"
