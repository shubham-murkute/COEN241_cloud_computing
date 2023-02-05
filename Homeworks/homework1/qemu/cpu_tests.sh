#! /bin/bash

echo "CPU TESTS"

PRIMES_UPTO=("30000" "50000" "20000")
MAX_TIME=("10" "30" "20")
THREADS=("1" "4" "4")
TEST_RUNS=5
TEST_CASES=3

for ((i=0; i<$TEST_CASES;i++))
do
	echo "*****************************Starting ${i+1} Test Case***************************************"
	for (( j=1; j <=$TEST_RUNS; j++ ))
	do
		echo "Running ${j}th run of Test Case ${i+1}"
		sysbench cpu --threads=${THREADS[$i]} --cpu-max-prime=${PRIMES_UPTO[$i]} --time=${MAX_TIME[$i]} run
		echo "Completed ${j}th run of Test Case ${i+1}"
	done
	echo "*****************************Completed ${i} Test Case***************************************"
done