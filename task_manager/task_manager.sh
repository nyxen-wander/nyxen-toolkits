#!/bin/bash

set -euo pipefail

# declare an array named 'tasks'
declare -a tasks=()

# declare a text file to save tasks in the future
TEXT_FILE="task_list.txt"

# check if TEXT_FILE exists
if [[ -e "$TEXT_FILE" ]]; then

	# read TEXT_FILE into tasks array
	while IFS= read -r line; do
		tasks+=("$line")
	done < "$TEXT_FILE"
else

	# if it doesn't exist, create a new one
	touch "$TEXT_FILE"
fi

# check if there's any given argument
if [[ "$#" -gt 0 ]]; then

	# check if arguments given is less than or equal to two
	if [[ "$#" -le 2 ]]; then

		# check first argument in case
		case "$1" in

			# 'add' case
			"add")

				# check if given arguments are exactly two
				if [[ "$#" -eq 2 ]]; then

					# append new task to the tasks array
					tasks+=("$2")

					# print success message
					printf "Added task: \"$2\".\n"
				else

					# if more than two arguments given, print an error message
					echo "Error: Task description argument expected."

					# error exit code
					exit 1
				fi
				;;

			# 'list' case
			"list")

				# get tasks array's length
				ARR_LEN="${#tasks[@]}"

				# check if there's any task in tasks array
				if [[ "$ARR_LEN" -gt 0 ]]; then

					echo "Tasks: "

					# set index counter
					counter=0

					# iterate counter by ARR_LEN
					while [[ "$counter" -lt "$ARR_LEN" ]]; do

						# print each entry
						echo "$counter: ${tasks[$counter]}"

						# increment the counter
						((counter += 1))
					done
				else
					# if no task found, print message
					echo "No task found."
				fi
				;;

			# 'remove' case
			"remove")

				# check if given second argument is numeric only
				if [[ "$(echo "$2" | grep -cE '^[0-9]+$')" -gt 0 ]]; then

					# check if given second argument is in bound
					if [[ "$2" -le "$ARR_LEN" ]]; then

						# get task name by given second argument as an index
						TASK_NAME="${tasks["$2"]}"

						# remove task by its index
						unset tasks["$2"]

						# print message
						echo "Removed task: $TASK_NAME"
					else
						# if it out of bound, print message
						echo "Error: Index $2 is out of bound."

						# error exit code
						exit 1
					fi

				else
					
					# if second argument is not numeric, print message
					echo "Error: Second argument expected to be numeric."

					# error exit code
					exit 1
				fi
				;;

			# 'help' case
			help|-h|--help)

				printf "Usage: $0 <command> [args]\n\nTasks management tool.\n\nCommand:\n\tadd <task>\tAdd a new task\n"
				printf "\tlist\t\tList current tasks\n\tremove <index>\tRemove a task at given index\n"
				;;

			# else case
			*)
				# print error message
				echo "Error: Invalid argument given."

				# error exit code
				exit 1
				;;
		esac
	else
		# if more than two arguments given, print message
		echo "Error: Too many arguments recieved."

		# error exit code
		exit 1
	fi
else
	# if no argument given, print message
	echo "Error: Argument expected."

	# error exit code
	exit 1
fi

# flush the TEXT_FILE
> "$TEXT_FILE"

# save each task into TEXT_FILE
for item in "${tasks[@]}"; do
	echo "$item" >> "$TEXT_FILE"	
done
