#!/bin/bash

# deploy and keep track of pid
echo "Deploying via Docker..."

NAME=docker_name
IMAGE=demo_test

# run tests
echo "\nRunning Functional Tests using Protractor\n"
if ./node_modules/.bin/protractor conf.js ; then
	# shut down server
	docker stop $NAME
	# return appropriate exit code
	exit 0
else
	# shut down server
	docker stop $NAME
	# return appropriate exit code
	exit 1
fi


# need to stop