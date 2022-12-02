#!/bin/bash

STR="this is a string of words in a variable."

read -r -a Words <<< $STR

echo "first word is ${Words[0]}"
echo "sixth word is ${Words[5]}"
