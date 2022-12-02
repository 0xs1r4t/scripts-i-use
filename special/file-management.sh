#!/bin/bash

# manage files over a linux server

# create a file / change its timestamp
touch $file_name

# create and / or edit a file
vim $file_name

# concatenate file / print on standard output
cat $file_name
cat $file_name | grep <keyword>
cat $file1 >> $file2
echo "test" >> $file_name

# copy
cp $path_to_source $path_to_destination

# move
mv $path_to_source $path_to_destination

# output starting of file
head $file_name

# output ending of file
tail $file_name
