#!/bin/bash

echo "Enter your username:"
read USERNAME

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")

if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME');"
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
else
  RESULT=$($PSQL "SELECT COUNT(*), COALESCE(MIN(guesses), 0) FROM games WHERE user_id=$USER_ID;")
  IFS='|' read -r GAMES BEST_GAME <<< "$RESULT"
  echo "Welcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$((RANDOM % 1000 + 1))
GUESSES=0

echo "Guess the secret number between 1 and 1000:"

while true
do
  read GUESS

  if [[ "$GUESS" =~ ^[0-9]+$ ]]
  then
    ((GUESSES++))

    if [[ $GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"

    elif [[ $GUESS -lt $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"

    else
      echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

      $PSQL "INSERT INTO games(user_id, number, guesses) VALUES($USER_ID, $SECRET_NUMBER, $GUESSES);"

      break
    fi

  else
    echo "That is not an integer, guess again:"
  fi
done
