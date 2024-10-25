#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER() {
  MIN="$1"
  MAX="$2"
  RANGE=$((MAX - MIN + 1))
  RAND=$((MIN + (RANDOM % RANGE)))
  echo "$RAND"
}

GUESS_NUMBER () {
  if [[ $1 ]]
  then
    echo $1
  else
    echo Guess the secret number between 1 and 1000:
  fi

  read NUMBER

  NUMBER_OF_TRIES=$((NUMBER_OF_TRIES + 1))

  if [[ ! $NUMBER =~ ^[0-9]+$ ]]
  then
    GUESS_NUMBER "That is not an integer, guess again:"
  elif [[ $NUMBER > $SECRET_NUMBER ]]
  then
    GUESS_NUMBER "It's lower than that, guess again:"
  elif [[ $NUMBER < $SECRET_NUMBER ]]
  then
    GUESS_NUMBER "It's higher than that, guess again:"
  else
    USER_INSERT_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USER_NAME') ON CONFLICT DO NOTHING")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USER_NAME'")
    GAME_INSERT_RESULT=$($PSQL "INSERT INTO games(user_id, number_of_tries) VALUES($USER_ID, $NUMBER_OF_TRIES)")
    echo You guessed it in $NUMBER_OF_TRIES tries. The secret number was $SECRET_NUMBER. Nice job!
  fi
}

echo Enter your username:
read USER_NAME

USER_EXISTS=$($PSQL "SELECT user_id FROM users WHERE name = '$USER_NAME'")

if [[ -z $USER_EXISTS ]]
then
  echo Welcome, $USER_NAME! It looks like this is your first time here.
else
  USER_INFO=$($PSQL "SELECT COUNT(*), MIN(number_of_tries) FROM games INNER JOIN users USING(user_id) WHERE name = '$USER_NAME'")
  USER_GAMES_PLAYED=$(echo "$USER_INFO" | cut -d "|" -f 1)
  USER_BEST_GAME=$(echo "$USER_INFO" | cut -d "|" -f 2)
  echo Welcome back, $USER_NAME! You have played $USER_GAMES_PLAYED games, and your best game took $USER_BEST_GAME guesses.
fi

SECRET_NUMBER=$(RANDOM_NUMBER 1 1000)
NUMBER_OF_TRIES=0
GUESS_NUMBER
