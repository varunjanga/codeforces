#!/bin/bash
taskid=$(echo $1 | awk '{print toupper($0)}')
g++ $taskid.cpp -D ONLINE_JUDGE
if [ $? -eq 0 ];then
	echo "Compiling "$taskid".cpp success!"
	echo "-----------------------------------"
	numsamples=$(cat tests\/${taskid}_num_samples)
	for test_id_ in $(seq 1 ${numsamples})
	do
		test_id=$(echo ${test_id_} - 1 |bc)
		./a.out < tests/$taskid"_in_"$test_id > tests/$taskid"_myout_"$test_id
		diff_data=$(diff tests/${taskid}"_myout_"$test_id tests/$taskid"_out_"$test_id -bB)
		echo -n "Test case #"$test_id" : "
		if [ "$diff_data" == "" ];then
			echo "PASSED"
		else
			echo "FAILED"
			indent_width="    "
			echo "$indent_width|--------------------------------"
			echo "$indent_width| Expected output:"
			awk  -v indent_width="${indent_width}" '{ print indent_width"| " $0 }'  tests/$taskid"_out_"$test_id
			echo "$indent_width|--------------------------------"
			echo "$indent_width| Your output:"
			awk  -v indent_width="${indent_width}" '{ print indent_width"| " $0 }'  tests/$taskid"_myout_"$test_id
			echo "$indent_width|--------------------------------"
		fi
	done
else
   echo "==============================="
   echo "Compiling "$taskid".cpp FAILED!"
fi
