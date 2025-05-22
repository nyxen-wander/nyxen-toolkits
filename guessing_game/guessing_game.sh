#!/bin/bash

#variables definition
SECRET_NUMBER=$((RANDOM % 10 + 1))
GUESS=0
LIVES=5
LIVES_LEFT="$LIVES"

#game flow/loop handler
until [[ "$GUESS" -eq "$SECRET_NUMBER" ]]; do

	#check if there's live(s) left
	if [[ "$LIVES_LEFT" -gt 0 ]]; then

		#print current live(s) left
		echo "Live(s) left: $LIVES_LEFT"
		echo ""

		#take user input
		read -p "Guess the number (1-10): " GUESS

		#ensure the input to be numerical only
		if ! [[ "$GUESS" =~ ^[0-9]+$ ]]; then
			echo "Invalid input! Accepting numeric input only."

			#reset the $GUESS to avoid an error message if there's a symbolic input
			GUESS=0
		else
			#wrong guess handler
			if ! [[ "$GUESS" -eq "$SECRET_NUMBER" ]]; then

				#clear screen
				clear

				#decrease left live(s) by 1 for each incorrect guess
				(( LIVES_LEFT-=1 ))

				#print message
				echo "Wrong! Try again."
			else
				#print message
				echo "Correct! Congratulations!!"

				#calculate guess accuracy
				echo "$LIVES_LEFT $LIVES" | awk '{printf "Guessing accuracy: %.2f%\n", (($1 / $2)*100)}'
			fi

		fi
	else
		clear

		#print message
		echo "No more live left. Bye!!"

		#break the loop if there's no live left
		break
	fi
done
