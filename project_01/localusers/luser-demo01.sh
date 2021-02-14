#! /bin/bash

# This script displays various information to the screen

# Display 'Hello'

echo 'Hello'

# Assign a value to a variable
WORD='script'

# Display the value using the variable
echo "$WORD"

# Single quotes stop variable expansion. If something needs to be interpreted use dougle quotes
echo '$WORD'

# Combine the variable with hard-codex tet
echo "This is a shell $WORD"

# Display the contents of the variables using an alternative syntax

echo "This is a shell ${WORD}"

# Append string to variable
echo "${WORD}ing is fun!"

# Create a new variable
ENDING='ed'

# Combine two variables
echo "This is ${WORD}${ENDING}."
