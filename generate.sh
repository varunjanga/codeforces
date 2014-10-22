#!/bin/bash
if [ ! $1 ];then
	echo "Input Format is 'generate.sh 444' where 'contest url id' is 444"
	exit
fi
mkdir -p $1
mkdir -p $1/tests/
cd $1
ln -fs ../scripts/verify_tests.sh verify_tests.sh
cd ..

problem_count=$(python scripts/get_problems_count.py $1)
echo $problem_count
for problem_num in $(seq 1 ${problem_count})
do
	problem_num=$(echo $problem_num+64 | bc)
	problem=$(printf "\x$(printf %x $problem_num)")
	echo -n $problem" "
	cp -n --no-clobber template.cpp $1/$problem.cpp
	python scripts/generate_problem.py $1 $problem
done
