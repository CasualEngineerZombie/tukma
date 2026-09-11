.PHONY: build test test-race vet fmt check run clean

BINARY := tukma

build:
	go build -o bin/$(BINARY) ./cmd/tukma

test:
	go test ./...

test-race:
	go test -race ./...

vet:
	go vet ./...

fmt:
	test -z "$$(gofmt -l .)" || (echo "Files need gofmt:"; gofmt -l .; exit 1)

check: fmt vet test

run:
	go run ./cmd/tukma

clean:
	rm -rf bin/
