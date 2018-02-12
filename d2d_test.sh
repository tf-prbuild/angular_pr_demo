#!/bin/bash

echo "\nRunning Functional Tests using Protractor\n"
if ./node_modules/.bin/protractor conf.js ; then
	# shut down server
	docker stop docker_name
	# return appropriate exit code
	exit 0
else
	# shut down server
	docker stop docker_name
	# return appropriate exit code
	exit 1
fi
