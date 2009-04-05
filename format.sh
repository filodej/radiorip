#! /bin/bash
source `dirname $0`/env.sh
xsltproc -o $TODAY_PROGRAM_BASE.htm program.xslt $TODAY_PROGRAM_BASE.xml

