all: functional_tests

functional_tests:
	@echo "\n\n\n--------\nRunning functional_tests...\n--------\n\n"
	./deploy_and_test.sh
	@echo "Running functional tests mandator/checker"
	@ruby check_if_func_test_needed.rb
