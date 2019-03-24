NAME=config-transpiler
VERSION=alpine

build: 
	docker image build --tag $(NAME):$(VERSION) . 
