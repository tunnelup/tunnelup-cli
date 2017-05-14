.PHONY: test

build:
	crystal build src/tunnelup.cr --release
test:
	crystal spec
