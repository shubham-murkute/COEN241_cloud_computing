#! /bin/bash

echo "FILE I/O TESTS"

THREADS=("8" "4" "6")
FILE_TOTAL_SIZES=("10G" "3G" "8G")
TEST_MODE=("rndwr" "seqrewr" "rndrw")
TEST_RUNS=5
TEST_CASES=3

for ((i=0; i<$TEST_CASES;i++))
do
	echo "*****************************Starting ${i+1}st Test Case***************************************"
	for (( j=1; j <=$TEST_RUNS; j++ ))
	do
		echo "Running ${j}st run of Test Case ${i+1}"
		sysbench --threads=${THREADS[$i]} fileio --file-total-size=${FILE_TOTAL_SIZES[$i]} --file-test-mode=${TEST_MODE[i]} prepare
		sysbench --threads=${THREADS[$i]} fileio --file-total-size=${FILE_TOTAL_SIZES[$i]} --file-test-mode=${TEST_MODE[i]} run
		sysbench --threads=${THREADS[$i]} fileio --file-total-size=${FILE_TOTAL_SIZES[$i]} --file-test-mode=${TEST_MODE[i]} cleanup
		echo "Completed ${j}st run of Test Case ${i+1}"
	done
	echo "*****************************Completed ${i}st Test Case***************************************"
done