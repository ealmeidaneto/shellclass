#! /bin/bash

if [[ ${UID} -ne 0 ]]; then
  echo "Script should run as root"
  exit 1
fi

# Prompt for user
read -p "Username: " USER_NAME

# Prompt for real name
read -p "Real name: " COMMENT

# Prompt for passwd

read -p "Password: " PASSWD

# Create new user

useradd -c "${COMMET}" -m "${USER_NAME}"

if [[ ${?} -ne 0 ]]; then
  echo "Not able to create user"
  exit 1
fi

HOST=$(hostname)
# Output results
echo "username: ${USER_NAME}, real name: ${COMMENT}, hostname: ${HOSTNAME}"
