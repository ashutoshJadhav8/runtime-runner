echo "This is from bash script" | tee /test-summary.txt
NUM=0
sdk_versions=0
REF=0
RUNTIME_TOTAL_TESTCASES=0
RUNTIME_PASSED_TESTCASES=0
RUNTIME_PASS_AVG=0
RUNTIME_FAILED_TESTCASES=0
RUNTIME_FAIL_AVG=0
RUNTIME_SKIPPED_TESTCASES=0
RUNTIME_SKIP_AVG=0
LIB_BUILD_EXIT_CODE=0
echo $RUNTIME_PASS_AVG | tee /test-summary.txt
echo $RUNTIME_SKIP_AVG | tee /test-summary.txt
echo $RUNTIME_FAIL_AVG | tee /test-summary.txt
echo Total Test cases Run:$RUNTIME_TOTAL_TESTCASES | tee /test-summary.txt
echo Test Passed:$RUNTIME_PASSED_TESTCASES | tee /test-summary.txt
echo Test failed:$RUNTIME_FAILED_TESTCASES | tee /test-summary.txt
echo Test skipped:$RUNTIME_SKIPPED_TESTCASES | tee /test-summary.txt
