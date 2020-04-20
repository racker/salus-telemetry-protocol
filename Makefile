
.PHONY: default
default: generate

.PHONY: generate
generate:
	go generate ./...

.PHONY: install-grpc-plugin
install-grpc-plugin:
	go install github.com/golang/protobuf/protoc-gen-go