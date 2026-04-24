.PHONY: all run build clean fmt lint zip

HS_SOURCES := $(shell find app src test -name '*.hs')

ARGS ?= -p ./dummy-parser.py -t ./dummy-interpreter.py example_sol_tests

ZIP_NAME ?= xschie03.zip
ZIP_CONTENTS := src app test flp-fun.cabal cabal.project README.md AI.md chat.jsonl Makefile

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

zip: clean
	rm -f $(ZIP_NAME)
	zip -r $(ZIP_NAME) $(ZIP_CONTENTS) -x '*/.DS_Store' '*/__MACOSX/*' '*/dist-newstyle/*'
