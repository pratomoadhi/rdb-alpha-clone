#! /bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~\n"

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

ALL_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

DISPLAY_SERVICES () {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  if [[ $2 ]]
  then
    echo "$2" | while IFS=" |" read SERVICE_ID SERVICE_NAME
    do
      echo "$SERVICE_ID) $SERVICE_NAME"
    done
  fi
}

APPOINTMENT_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    DISPLAY_SERVICES "Enter a valid number" "$ALL_SERVICES"
    APPOINTMENT_MENU
    return
  fi

  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  if [[ -z $SERVICE_NAME ]]
  then
    DISPLAY_SERVICES "I could not find that service. What would you like today?" "$ALL_SERVICES"
    APPOINTMENT_MENU
    return
  fi

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  echo -e "\nWhat time would you like your cut, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
  read SERVICE_TIME

  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
}

DISPLAY_SERVICES "Welcome to My Salon, how can I help you?\n" "$ALL_SERVICES"
APPOINTMENT_MENU
