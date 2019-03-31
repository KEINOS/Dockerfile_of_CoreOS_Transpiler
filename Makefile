NAME=config-transpiler
VERSION=latest

build: 
	docker image build \
	  --no-cache \
	  --rm \
	  --compress \
	  --tag $(NAME):$(VERSION) \
	  .
	docker image prune -f
	docker image ls | grep $(NAME)
	docker run --rm $(NAME):$(VERSION) /test/run_test.sh
