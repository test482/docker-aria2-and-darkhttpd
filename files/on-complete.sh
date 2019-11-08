#!/bin/sh

# Func: When the download is complete, if only hanve 1 file, move to top directory.
# aria2 passes 3 arguments to specified command when it is executed. 
# These arguments are: GID, the number of files and file path. 
if [ $2 -eq 1 ]; then
	mv "$3" /data
fi
echo [$(date)] $2, $3, $1 "<br>" >> /data/_log.html