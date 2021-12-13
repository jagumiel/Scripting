#!/bin/bash

#DeletesspacesfromXMLfile.

for file in *
do
	if cmp -s "$file" "deleteBlanksFromXML.sh"; then
                :
	else
		cat $file | tr -d [:blank:] > temp.xml
		cat temp.xml > $file
	fi
done

rm -rf temp.xml
