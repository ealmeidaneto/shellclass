#! /bin/bash

# This script demonstrate I/O redirection.

# Redirect STOUT to a file.
FILE="/tmp/data"
head -n1 /etc/passwd >${FILE}

# Redirect STIN to a file.
read -r LINE <${FILE}
echo "LINE contains: ${LINE}"

# Redirect STOUT to a file, overwriting the file.
head -n3 /etc/passwd >${FILE}
echo
echo "Contents of ${FILE}:"
cat ${FILE}

# Redirect STDOUT to a file, appeding to the file.
echo "${RANDOM} ${RANDOM}" >>${FILE}
echo "${RANDOM} ${RANDOM}" >>${FILE}
echo
echo "Contents of ${FILE}:"
cat ${FILE}

# Redirect STDIN to a program, using FD 0.
read -r LINE 0<${FILE}
echo
echo "LINE contains: ${LINE}"

# Redirect STDOUT to a file using FD1, overwriting the file.
head -n3 /etc/passwd 1>${FILE}
echo
echo "Contents of ${FILE}:"
cat ${FILE}

# Redirect STERR to a file using FD 2.
ERR_FILE="/tmp/data.err"
head -n3 /etc/passwd /fakefile 2>${ERR_FILE}

# Redirect STDOUT and STERR to a file.
head -n3 /etc/passwd /fakefile &>${FILE}
echo
echo "Contents of ${FILE}:"
cat ${FILE}

# Redirect STOUT and STERR through a pipe.
echo
head -n3 /etc/passwd /fakefile |& cat -n

# Send output to STDERR
echo "This is STDERR!" >&2

# Discard STDOUT
echo
echo "Discarding STOUT:"
head -n3 /etc/passwd /fakefile >/dev/null

# Discard STERR
echo
echo "Discarding STERR:"
head -n3 /etc/passwd /fakefile 2>/dev/null

# Discard STOUT and STDERR
echo
echo "Discarding STDOUT and STERR:"
head -n3 /dev/passwd /fakefile &>/dev/null

# Clean up
rm ${FILE} ${ERR_FILE} &>/dev/null
