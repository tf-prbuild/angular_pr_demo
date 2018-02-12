all: unit_tests functional_tests

unit_tests:
	@echo "\n\n\n--------\nRunning unit_tests...\n--------\n\n"
	@rm -rf old_coverage && git pull origin master && mv coverage old_coverage
	./node_modules/.bin/karma start karma.conf.js
	@ruby code_coverage_checker.rb

functional_tests:
	@echo "\n\n\n--------\nRunning functional_tests...\n--------\n\n"
	./deploy_and_test.sh
	@echo "Running functional tests mandator/checker"
	@ruby check_if_func_test_needed.rb
