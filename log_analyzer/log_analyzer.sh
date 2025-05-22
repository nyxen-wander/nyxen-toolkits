#!/bin/bash

#check if resource argument being passed
if [[ "$#" -eq 2 ]]; then

	#print message that filters the result based on given resource type
	printf "Unique IP address(es) that accessed $2:\n\n"

	#grep resource(s) from log file, sort them, strip the duplicate result (if any), format the output
	grep "$2" "$1" | sort | uniq | awk '{time=$4$5; printf "Source IP: %s\nTime: %s\nResource: %s\nStatus code: %s\n\n", $1, time, $7, $9}'
	
	#print completion message
	printf "Analysis completed.\n"

	#success exit code
	exit 0

#check if resource argument is ommitted
elif [[ "$#" -eq 1 ]]; then

	#print message without filter
	printf "Unique IP address(es) that accessed *:\n\n"

	#print log file, sort them, strip the duplicate result (if any), format the output
	cat "$1" | sort | uniq | awk '{time=$4$5; printf "Source IP: %s\nTime: %s\nResource: %s\nStatus code: %s\n\n", $1, time, $7, $9}'
	
	#print completion message
	printf "Analysis completed.\n"
	
	#success exit code
	exit 0

#check if there is no given argument
else
	#print out help guides
	printf "USAGE\n$0 <file> <resource>\n\n"
	printf "EXAMPLE\n$0 file.log index.html\n\n"
	printf "ARGUMENT\nfile\t\tA log file to be analyzed\n"
	printf "resource\tA resource being requested by a host (Example: index.html, icon.png, ...)\n"

	#warning exit code
	exit 1

fi
