HUB ?= dio123
PORT ?= 8000

build:
	docker build . -t $(HUB):envoy-lua-test

run:
	docker run --rm -it -v $(PWD)/envoy.yaml:/etc/envoy/envoy.yaml -p $(PORT):8000 -t $(HUB):envoy-lua-test -c /etc/envoy/envoy.yaml
