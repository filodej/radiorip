PREVIEW=14
DIR_BASE="input"
FILE_NAME="program.xml"
URL_BASE="http://www2.rozhlas.cz/program/xml"
DATE_MASK="+%Y-%m-%d"
TODAY=`date $DATE_MASK`
FILE_MAP="$DIR_BASE/$TODAY/files.xml"
echo "<files>" > $FILE_MAP
DAY=0
while [ "$DAY" -lt "$PREVIEW" ]
do
  DATE=`date $DATE_MASK --date="$DAY day"`
  URL="$URL_BASE/$DATE"
  DIR="$DIR_BASE/$DATE"
  FILE="$DIR/$FILE_NAME"
  echo "  <file>$FILE</file>" >> $FILE_MAP
#  if [ ! -d $DIR ]; then
#    mkdir $DIR
#    wget --output-document=$FILE $URL
#  fi
  DAY=$(($DAY + 1))
done
echo "</files>" >> $FILE_MAP


