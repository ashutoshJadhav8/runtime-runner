echo "This is from bash script" >> /script-details
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
echo $RUNTIME_PASS_AVG >> /script-details
echo $RUNTIME_SKIP_AVG >> /script-details
echo $RUNTIME_FAIL_AVG >> /script-details
echo Total Test cases Run:$RUNTIME_TOTAL_TESTCASES >> /script-details
echo Test Passed:$RUNTIME_PASSED_TESTCASES >> /script-details
echo Test failed:$RUNTIME_FAILED_TESTCASES >> /script-details
echo Test skipped:$RUNTIME_SKIPPED_TESTCASES >> /script-details
