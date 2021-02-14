#! /bin/bash

if [[ ${UID} -ne 0 ]]; then
    echo "Script should run as root"
    exit 1
fi

if [[ "${#}" -lt 1 ]]; then
    echo "Account name is required. Please provide one!"
    exit 1
fi

USERNAME=${1}
COMMENT=${*:2}
PASSWORD=$(date +%s%N | sha256sum | head -c32)

useradd -c "${COMMENT}" -m "${USERNAME}" -p "${PASSWORD}"

if [[ ${?} -ne 0 ]]; then
    echo "Not able to create user"
    exit 1
fi

echo "Username:"
echo "${USERNAME}"
echo "Password:"
echo "${PASSWORD}"
echo "host"
echo "$(hostname)"
