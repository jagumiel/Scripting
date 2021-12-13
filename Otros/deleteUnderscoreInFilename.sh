#!/bin/bash

#Deletes underscores in a filename.

for file in *
do
	if cmp -s "$file" "replaceBlanksInFilename.sh" ;then
		: #Semicolonmeansno-operation.Youcan'tmodifythenameofascriptwhichisexecuting.
	else
		mv "$file" `echo $file | tr -d '_'`
fi
done
