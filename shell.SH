rm -f output.txt
url = "$0"
echo "$1"
echo $url

var=$(git pull "$1" 2>&1)
echo $var
echo "trying to grep:"
echo "$var" | grep -o "up to dates" >> output.txt
#echo "$var" >> output.txt
