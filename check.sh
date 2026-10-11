#!/bin/sh
# The fixture's one check: greeting.txt starts with "hello". Writes JUnit for Relay's report, and exits 1 on a failure.
mkdir -p relay-results/junit
if grep -q '^hello' greeting.txt; then
	failures=0
	testcase='<testcase classname="fixture" name="greeting.txt starts with hello"/>'
else
	failures=1
	testcase='<testcase classname="fixture" name="greeting.txt starts with hello"><failure message="greeting.txt does not start with hello"/></testcase>'
fi
printf '<?xml version="1.0" encoding="UTF-8"?>\n<testsuites><testsuite name="fixture" tests="1" failures="%s">%s</testsuite></testsuites>\n' \
	"$failures" "$testcase" > relay-results/junit/check.xml
echo "checked greeting.txt: $(head -n 1 greeting.txt)"
exit "$failures"
