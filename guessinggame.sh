#!/bin/bash

# Function to count the number of files in the current directory
count_files() {
  local file_count=$(find . -maxdepth 1 -type f | wc -l)
  echo "$file_count"
}

# Main function
play_game() {
  echo "Welcome to the guessing game!"
  echo "Try to guess how many files are there in current directory!"

  local count=$(count_files)
  local file_count=0
  local user_guess

  while true; do
    read -p "Your guess: " user_guess
    ((file_count++))

    # Compare the user's guess with the actual file count using numerical comparison operators.
    if (( user_guess == count )); then
      echo "Congratulations! You guessed the correct number of files: $count, in $file_count tries."
      break
    elif (( user_guess < count )); then
      echo "Guess is too low. try again."
    else
      echo "guess is too high. try again."
    fi
  done
}

play_game
