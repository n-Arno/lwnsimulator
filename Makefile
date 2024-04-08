build-test:
	docker build . -t lwnsim:latest

run-test: 
	docker run -d -p 8000:8000 --name lwnsim lwnsim:latest

clean-test:
	docker rm --force lwnsim
