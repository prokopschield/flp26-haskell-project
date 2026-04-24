.PHONY: all run build clean fmt lint

HS_SOURCES := $(shell find app src test -name '*.hs')

ARGS ?= -p ./dummy-parser.py -t ./dummy-interpreter.py example_sol_tests

all: fmt lint build run

run:
	cabal run flp-fun -- $(ARGS)

build:
	cabal build

clean:
	cabal clean

fmt:
	ormolu --mode inplace $(HS_SOURCES)

lint:
	hlint app src test
