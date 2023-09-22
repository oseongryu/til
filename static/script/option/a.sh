#Read the argument values based on the options
while getopts "i:r:" var
do
   case "$var" in
       i) ID=${OPTARG};;
       r) GPA=${OPTARG};;
   esac
done

#Print message based on the matching ID value passed in the argument
if [[ "$ID" == "56" ]]; then
    echo "Mir Sabbir obtained $GPA"
elif [[ "$ID" == "34" ]]; then
    echo "Nirob Ahsan obtained $GPA"
else
    echo "ID is invalid."
fi