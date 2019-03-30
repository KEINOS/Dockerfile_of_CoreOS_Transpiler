NAME=config-transpiler
VERSION=latest

build: 
	docker image build --no-cache --tag $(NAME):$(VERSION) .
	docker image prune -f
	docker image ls | grep config-transpiler
	docker run --rm config-transpiler:$(VERSION) ct --version
