#!/bin/bash

#Replaces spaces in a file name by underscores.

for file in *
do
	if cmp -s "$file" "replaceBlanksInFilename.sh" ;  then
		:	#Semicolon means no-operation. You can't modify the name of a script which is executing.
	else
		mv "$file" `echo $file | tr ' ' '_'`
	fi
done
