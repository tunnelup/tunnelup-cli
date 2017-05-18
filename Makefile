.PHONY: test deps

build : deps
	crystal build src/tunnelup.cr --release

test : deps
	crystal spec

deps :
	crystal deps
