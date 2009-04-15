#!/bin/bash
CAT=/bin/cat
source ../../env.sh
#echo -e -n "HTTP/1.0 200 OK\r\n"
echo -e -n "Content-type: text/html\r\n"
echo -e -n "\r\n"

$CAT ../../$TODAY_SHEDULE_BASE.htm




