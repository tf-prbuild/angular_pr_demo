all: publish

publish:
	docker build -t ndmanvar/demo_test .
	docker push ndmanvar/demo_test
	docker rmi ndmanvar/demo_test
