#! /bin/bash
source `dirname $0`/env.sh
xsltproc -o $TODAY_PROGRAM_BASE.xml merge.xslt $TODAY_FILES
