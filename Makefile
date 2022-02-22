HUB ?= mengjial
PORT ?= 8000

build:
	docker build . -t $(HUB)/lua-envoy-test:latest

run:
	docker run --rm -it -v $(PWD)/envoy.yaml:/etc/envoy/envoy.yaml -p $(PORT):8000 -t $(HUB)/lua-envoy-test:latest -c /etc/envoy/envoy.yaml