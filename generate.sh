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
for problem in {A..E}
do
	echo -n $problem" "
	cp -n --no-clobber template.cpp $1/$problem.cpp
	python scripts/GenerateProblem.py $1 $problem
done
