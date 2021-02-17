#! /bin/bash

# This script deletes a user.

# Run as root.

if [[ "${UID}" -ne 0 ]]
then
    echo "Script should run as root." >&2
    exit 1
fi

# Assume the first argument is the user to delete.
USER="${1}"

if userdel "${USER}"; then

    echo "The account ${USER} was deleted."
    exit 0

else

    echo "The account ${USER} was NOT deleted."
    exit 1

fi

# Delete the user
#userdel "${USER}"

# Make sure the user got deleted
#if [[ "${?}" -ne 0 ]]
#then
    #echo "The account ${USER} was NOT deleted." >&2
    #exit 1
#fi


# Tell the user the account was deleted.
#echo "The account ${USER} was deleted."
#exit 0
