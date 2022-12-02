#!/bin/bash

VAR="this is a string containing txt"

if grep -q "txt" <<< "$VAR"
then
	echo "$VAR contains the substring sequence \'txt\'"
else
	echo "nope, didn't find it"
fi
