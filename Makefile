setup:
	@echo "\n\n\n--------\nRunning setup...\n--------\n\n"
	npm install

publish:
	docker build -t ndmanvar/demo_test .
	docker push ndmanvar/demo_test
	docker rmi ndmanvar/demo_test
