#! /bin/bash
source `dirname $0`/env.sh
source ./env.sh
PREVIEW_DAYS=14
mkdir -p "$TODAY_DIR"
echo "<files>" > $TODAY_FILES
DAY=0
while [ "$DAY" -lt "$PREVIEW_DAYS" ]
do
  DATE=`date $DATE_MASK --date="$DAY day"`
  URL="$BASE_URL/$DATE"
  DIR="$BASE_DIR/$DATE"
  FILE="$DIR/$FILE_NAME"
  REL_FILE="../$DATE/$FILE_NAME"
  echo "  <file>$REL_FILE</file>" >> $TODAY_FILES
#  if [ ! -d $DIR ]; then
    mkdir -p $DIR
    wget --output-document=$FILE $URL
#  fi
  DAY=$(($DAY + 1))
done
echo "</files>" >> $TODAY_FILES


