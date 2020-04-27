This module contains Protobuf definitions for external and inter-service communication
in Salus Telemetry. The built library includes the Java classes generated from those definitions.

This repository also supplies a Go library for using the Salus Telemetry protocols, which can be added as a dependency using:

```bash
go get -u github.com/racker/salus-telemetry-protocol
```

# Generating Java source from Avro/Protobuf schemas

Some of the data model types are generated from Avro and Protobuf schemas located in
- [src/main/avro](src/main/avro)
- [src/main/proto](src/main/proto)

The Java source code is generated during a normal Maven build; however, the specific phase
`generate-sources` can be used to only perform the code generation:

```bash
mvn generate-sources
```

Any regular Maven phases, like `compile`, `package`, or `install` will also work since they
pass through the `generate-sources` phase, 
[as seen here](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html#Lifecycle_Reference).

# Generating Go source

**NOTE** unlike Java code generation, the generated Go source code **must be** source controlled. This is due to Go's ability to reference a git repository as the library/module rather than requiring a separately built and deployed artifact.

## One-time setup

Install Go 1.13 or newer.

Install protoc by using one of the following options:
- Follow the [instructions in the quickstart guide](https://grpc.io/docs/quickstart/go/#protocol-buffers)
- On Mac OS you can use `brew install protobuf`
- On Windows you can use `scoop install protobuf` where Scoop is available [here](https://scoop.sh/)
- On Debian based Linux systems you can use `apt-get install protobuf-compiler`

Download the modules required by the generated code by invoking
```bash
go mod download
```

Install the grpc plugin for protoc by invoking
```bash
make install-grpc-plugin
```

Make sure `$GOPATH/bin` is in your `$PATH`. If you don't have `$GOPATH` declared, reference `$HOME/go/bin` instead.

## Re-generating source code

When changes are made to the proto files, re-generate the `*.pb.go` files using:
```bash
make generate
```

**Don't forget to git add and commit the re-generated files**

# Performing a release

While on the latest commit of `master` ensure there are no local changes and run the following.

```bash
mvn release:clean release:prepare
```

### Notes 
When choosing the next snapshot version, use the `X.Y-SNAPSHOT` form where Y "rounds up" from the 
released `X.Y.Z`. For example, when releasing `0.1.1` specify `0.2-SNAPSHOT` as the next snapshot.
You would again specifiy `0.2-SNAPSHOT` if later releasing a bug fix `0.1.2`.
