#! /bin/bash
source `dirname $0`/env.sh
xsltproc -o $TODAY_SHEDULE_BASE.xml filter.xslt $TODAY_PROGRAM_BASE.xml

