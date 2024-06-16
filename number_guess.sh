#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

is_integer() {
    # Use a regex to check if the input consists of digits only
    [[ $1 =~ ^[0-9]+$ ]]
}
echo Enter your username:
read USERNAME
GET_USER_RESULT=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
if [[ -z $GET_USER_RESULT ]]
then 
echo Welcome, $USERNAME! It looks like this is your first time here.
RANDOM_NUMBER=$(( ( RANDOM % 1000 ) + 1 ))
#echo $RANDOM_NUMBER

echo Guess the secret number between 1 and 1000:
read NUMBER
while ! is_integer "$NUMBER"; do
    echo "That is not an integer, guess again:"
    read NUMBER
done
COUNT=1
while [ "$NUMBER" -ne "$RANDOM_NUMBER" ]
   do
    if [ "$NUMBER" -lt "$RANDOM_NUMBER" ]
     then
        (( COUNT++ ))
        echo "It's lower than that, guess again:"
       else
        (( COUNT++ ))
        echo "It's higher than that, guess again:"
    fi
    read NUMBER
   while ! is_integer "$NUMBER"; do
    echo "That is not an integer, guess again:"
    read NUMBER
    done
done
INSERT_RESULT=$($PSQL "INSERT INTO users(username,games_played,best_game) VALUES('$USERNAME',1,$COUNT)")
#echo $INSERT_RESULT
echo You guessed it in $COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!
#echo $COUNT

else 
GET_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
GET_BEST=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
echo Welcome back, $USERNAME! You have played $GET_PLAYED games, and your best game took $GET_BEST guesses.
RANDOM_NUMBER=$(( ( RANDOM % 1000 ) + 1 ))
#echo $RANDOM_NUMBER

echo Guess the secret number between 1 and 1000:
read NUMBER
while ! is_integer "$NUMBER"; do
    echo "That is not an integer, guess again:"
    read NUMBER
done
COUNT=1
while [ "$NUMBER" -ne "$RANDOM_NUMBER" ]
   do
    if [ "$NUMBER" -lt "$RANDOM_NUMBER" ]
     then
        (( COUNT++ ))
        echo "It's lower than that, guess again:"
       else
        (( COUNT++ ))
        echo "It's higher than that, guess again:"
    fi
    read NUMBER
    while ! is_integer "$NUMBER"; do
    echo "That is not an integer, guess again:"
    read NUMBER
done
done
(( GET_PLAYED++ ))
UPDATE_PLAYED=$($PSQL "UPDATE users SET games_played=$GET_PLAYED WHERE username='ganzo'")
if [[ "$GET_BEST" -gt "$COUNT" ]]
then
UPDATE_BEST= $($PSQL "UPDATE users SET best_game = $COUNT WHERE username='ganzo'")
fi

echo You guessed it in $COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!

fi
