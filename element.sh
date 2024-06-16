#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
#SELECT="SELECT atomic_number,symbol,name,type,atomic_mass,boiling_point_celsius,melting_point_celsius FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id)"
if [[ -z $1 ]]
then 
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # Argument is a number
    RESULT=$($PSQL "SELECT atomic_number,symbol,name,type,atomic_mass,boiling_point_celsius,melting_point_celsius FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number = $1")
  else
    # Argument is a string
    RESULT=$($PSQL "SELECT atomic_number,symbol,name,type,atomic_mass,boiling_point_celsius,melting_point_celsius FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE symbol = '$1' OR name = '$1'")
  fi

  if [[ -z $RESULT ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$RESULT" | while IFS='|' read -r ATOMIC SYM NAME TYPE MASS BOIL MELT
    do
    echo "The element with atomic number $ATOMIC is $NAME ($SYM). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
    done
  fi
fi