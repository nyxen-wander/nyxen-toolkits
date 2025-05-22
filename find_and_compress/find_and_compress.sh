#!/bin/bash

#define variables
FILE_IS_EXIST=0
COMPRESS_FILE_NAME=""

#check if given argument is exactly one argument
if [[ "$#" -eq 1 ]]; then

	#check if given argument is a directory
	if [[ -d "$1" ]]; then

		#update FILE_IS_EXIST to hold whether there is log file inside $1 dir
		FILE_IS_EXIST=$(find "$1" -maxdepth 1 -name "*.log" -type f | wc -l)

		#check if log file exists in $1
		if [[ "$FILE_IS_EXIST" -gt 0 ]]; then

			#set file name into a variable
			COMPRESS_FILE_NAME="compressed_logs_$(date +%Y-%m-%d_%H%M%S).tar.gz"

			#compress all log files inside $1 dir with .tar.gz extension
			find "$1" -maxdepth 1 -name "*.log" -type f -exec tar -cvzf "$COMPRESS_FILE_NAME" {} + 2> /dev/null

			#print successful message
			printf "Compression succeeded.\n"

			#successful code status
			exit 0

		#check if there is no log file exists in $1
		else

			#print error message
			printf "Error: There is no file with .log extension in $1\n"

			#error code status
			exit 2
			
		fi

	#check if $1 is not a directory
	else
		#print error message
		printf "Error: $1 is not a directory.\n"

		#error code status
		exit 2

	fi

#check if there is no argument given
else
	#print this script's usage guidance
	printf "USAGE\n\t$0 <dir>\n\n"
	printf "EXAMPLE\n\t$0 /home/user/example_dir\n\n"
	printf "ARGUMENT\n\tdir\t\tDirectory path where targeted log files belong\n\n"

	#print warning code status
	exit 1

fi
