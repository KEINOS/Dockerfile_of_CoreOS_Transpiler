NAME=config-transpiler
VERSION=latest

build: 
	docker image build --tag $(NAME):$(VERSION) . 
