#check all csv values are valid
"csv_file"="$(dirname $(dirname $(realpath $0)))/src/database.csv"

test_passed=true
while IFS=, read -r username used_data max_data; do
  [[ "$used_data" > "$max_data" ]] && echo "$username has too much data stored" && test_passed = false
  [[ "$used_data" < 0 ]] && echo "$username has negative data stored" && test_passed = false
  [[ "$max_data" < 0 ]] && echo "$username has negative data cap" && test_passed = false
done < "$csv_file"
if [ "$test_passed"=true ];then echo "OK";fi
