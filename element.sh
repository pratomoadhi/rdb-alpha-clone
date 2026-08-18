#!/bin/bash
if [ "$#" -eq 1 ]; then
  PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
  QUERY="SELECT * FROM elements AS el INNER JOIN properties AS pr ON el.atomic_number=pr.atomic_number INNER JOIN types AS tp ON pr.type_id=tp.type_id"
  if [[ "$1" =~ ^[0-9]+$ ]]; then
    ELEMENT=$($PSQL "$QUERY WHERE el.atomic_number=$1 LIMIT 1")
  else
    ELEMENT=$($PSQL "$QUERY WHERE el.symbol='$1' OR el.name='$1' LIMIT 1")
  fi

  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$ELEMENT" | while IFS=" |" read ATOMIC_NUMBER SYMBOL NAME ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE_ID TYPE_ID TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  fi

else
  echo "Please provide an element as an argument."
fi
