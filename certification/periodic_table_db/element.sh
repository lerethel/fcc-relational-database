if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
  
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    WHERE_CONDITION="atomic_number = $1"
  else
    WHERE_CONDITION="symbol = '$1' OR name = '$1'"
  fi

  ELEMENT_INFO=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, boiling_point_celsius, melting_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE $WHERE_CONDITION")

  if [[ -z $ELEMENT_INFO ]]
  then
    echo I could not find that element in the database.
  else
    ELEMENT_ATOMIC_NUMBER=$(echo "$ELEMENT_INFO" | cut -d "|" -f 1)
    ELEMENT_SYMBOL=$(echo "$ELEMENT_INFO" | cut -d "|" -f 2)
    ELEMENT_NAME=$(echo "$ELEMENT_INFO" | cut -d "|" -f 3)
    ELEMENT_TYPE=$(echo "$ELEMENT_INFO" | cut -d "|" -f 4)
    ELEMENT_ATOMIC_MASS=$(echo "$ELEMENT_INFO" | cut -d "|" -f 5)
    ELEMENT_BOILING_POINT=$(echo "$ELEMENT_INFO" | cut -d "|" -f 6)
    ELEMENT_MELTING_POINT=$(echo "$ELEMENT_INFO" | cut -d "|" -f 7)
    echo "The element with atomic number $ELEMENT_ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELTING_POINT celsius and a boiling point of $ELEMENT_BOILING_POINT celsius."
  fi
fi
