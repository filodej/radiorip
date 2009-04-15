#! /bin/bash
source `dirname $0`/env.sh
xsltproc -o $TODAY_PROGRAM_BASE.htm format.xslt $TODAY_PROGRAM_BASE.xml
xsltproc -o $TODAY_SHEDULE_BASE.htm format.xslt $TODAY_SHEDULE_BASE.xml

