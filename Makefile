NAME=config-transpiler
VERSION=latest

build: 
	docker image build --no-cache --tag $(NAME):$(VERSION) .
	docker image prune -f
	docker image ls | grep $(NAME)
	docker run --rm $(NAME):$(VERSION) ct --version
