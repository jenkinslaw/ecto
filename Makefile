.PHONY: default test selftest jshint

default: test

test: selftest jshint

selftest:
	bin/ecto selftest

jshint:
	jshint .
