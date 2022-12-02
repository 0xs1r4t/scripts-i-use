ARR=(e1 e2 e3 {A..F})

while read element ; do
	echo $element
done <<< $(echo ${ARR[*]})
