#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

# Query user_id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")

if [[ -z $USER_ID ]]
then
  # First time user setup
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # Fetch games played and best game (fewest guesses)
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID;")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID;")
  
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
GUESSES=0

echo "Guess the secret number between 1 and 1000:"

while true
do
  read GUESS

  if [[ ! "$GUESS" =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    ((GUESSES++))

    if [[ $GUESS -eq $SECRET_NUMBER ]]
    then
      # Insert game record before printing final message
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, number, guesses) VALUES($USER_ID, $SECRET_NUMBER, $GUESSES);")
      echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      break
    elif [[ $GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi
  fi
done
