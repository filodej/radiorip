#! /bin/bash
BASE_DIR="input"
FILE_NAME="today.xml"
BASE_URL="http://www2.rozhlas.cz/program/xml"
DATE_MASK="+%Y-%m-%d"
TODAY=`date $DATE_MASK`
TODAY_DIR="$BASE_DIR/$TODAY"
TODAY_FILES="$TODAY_DIR/files.xml"
TODAY_PROGRAM_BASE="$TODAY_DIR/program"
