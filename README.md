This module contains Avro and Protobuf definitions for external and inter-service communication
in Salus Telemetry. The built library includes the Java classes generated from those definitions.

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

# Performing a release

While on the latest commit of `master` ensure there are no local changes and run the following.

```bash
mvn release:clean release:prepare
```

### Notes 
When choosing the next snapshot version, use the `X.Y-SNAPSHOT` form where Y "rounds up" from the 
released `X.Y.Z`. For example, when releasing `0.1.1` specify `0.2-SNAPSHOT` as the next snapshot.
You would again specifiy `0.2-SNAPSHOT` if later releasing a bug fix `0.1.2`.
