# Reads a listing of PMCIDs from INPUT and places the PMC BioC file in the OUTPUT folder

INPUT=${1}
echo ${INPUT}
OUTPUT=${2}
echo ${OUTPUT}

for file in ${INPUT}/*.xml; do
    [ -e "$file" ] || continue
	echo "FROM=${file}"
	newfile=$(echo "$file" | sed "s/${INPUT}/${OUTPUT}/g")
	echo "TO=  $newfile"
	xmllint --format $file > $newfile
done
