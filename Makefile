.PHONY: test

all: test

test:
	mkdir -p build/
	$(shell vessel bin)/moc $(shell mops sources) -wasi-system-api -o build/Tests.wasm test/Tests.mo && wasmtime build/Tests.wasm
	rm -f build/Tests.wasm

