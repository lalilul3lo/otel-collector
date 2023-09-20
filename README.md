# 🔭 otel-collector
A custom opentelemetry collector distribution for receiving, processing and exporting telemetry data.

![otel-collector](https://github.com/lalilul3lo/otel-collector/assets/12755671/d4adeaac-f7fe-49b1-8442-4a82f2321ea8)

## Usage

### Docker 🐳
**Prequisites:**
- Authenticated with the Container registry (`ghcr.io`).
> You need an access token to install private, internal, and public packages.
```bash
echo $PAT | docker login ghcr.io --username {some_username} --password-stdin
```

**Dependencies:**
- Otel [configuration](https://opentelemetry.io/docs/collector/configuration/) file
> Required in order to know what to collect, process and export. When running the distribution as a container, you will need to mount a config file.

> Configuration file will need to be mounted to the following path: `/app/otel_config.yaml`

*Example using `docker run`:*
```bash
docker run \
  -p 4317-4318:4317-4318 \
  -v $(pwd)/otel_config.yaml:/app/otel_config.yaml \
  ghcr.io/lalilul3lo/otel-collector:latest
```

## Components:
The following is the components that comprise this otel distribution. [Basic knowledge](https://opentelemetry.io/docs/concepts/components/) is assumed.

### Receivers
- [`otlpreceiver`](https://github.com/open-telemetry/opentelemetry-collector/blob/main/receiver/otlpreceiver/README.md)
- [`hostmetricsreceiver`](https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/receiver/hostmetricsreceiver/README.md)
### Extensions
- [`zpagesextension`](https://github.com/open-telemetry/opentelemetry-collector/tree/main/extension/zpagesextension)
- [`ballastextension`](https://github.com/open-telemetry/opentelemetry-collector/blob/main/extension/ballastextension/README.md)
- [`healthcheckextension`](https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/extension/healthcheckextension)
- [`pprofextension`](https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/extension/pprofextension)
### Exporters
- [`debugexporter`](https://github.com/open-telemetry/opentelemetry-collector/tree/main/exporter/debugexporter)
- [`otlpexporter`](https://github.com/open-telemetry/opentelemetry-collector/tree/main/exporter/otlpexporter)
