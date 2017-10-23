#!/bin/bash

#Antczak Kamil, Mazur Wojciech

if [[ -z $* ]]; then #check if arguments are an empty string
    echo No variables passed
    exit 1
fi

for f in $@
do
    if [ -f $f ]; then
        echo File $f exists; ((FSUM++)) #add files
    elif [ -d $f ]; then
        echo Directory $f exists; ((DSUM++)) #add directories
	FNUM=`find ./$f -maxdepth 1 -type f | wc -l` #count lines given by find function
	DIRNUM=`find ./$f -maxdepth 1 -type d | wc -l`; ((--DIRNUM)) 	#minus self
	echo In $f there are $FNUM files and $DIRNUM directories.
    else
        echo $f doesnt exists; ((NSUM++)) #add nonexsistent
    fi
((VARPASSED++))	#increment number of arguments
done

echo Statistics: arguments passed $VARPASSED, including: files - $FSUM, directories - $DSUM, nonexistent items - $NSUM.

exit 0
