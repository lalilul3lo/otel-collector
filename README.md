# 🔭 otel-collector
A custom opentelemetry collectory distribution for receiving, processing and exporting telemetry data.

![otel-collector](https://github.com/lalilul3lo/otel-collector/assets/12755671/d4adeaac-f7fe-49b1-8442-4a82f2321ea8)

## Usage
### Docker 🐳
The collector requires a configuration file in order to know what to collect, process and export. When running the distribution as a container, you will need to mount a config file. Configuration files will need to be mounted to the following path: `/app/otel_config.yaml`

**Example:**

```bash
docker run \
  -p 4317-4318:4317-4318 \
  -v $(pwd)/otel_config.yaml:/app/otel_config.yaml \
  ghcr.io/lalilul3lo/otel-collector:latest
```

## Components:
The following is the components that comprise this otel distribution. [Basic knowledge](https://opentelemetry.io/docs/concepts/components/) is assumed.

### Receivers
- `otlpreceiver`
- `hostmetricsreceiver`
### Extensions
- `zpagesextension`
- `ballastextension`
- `healthcheckextension`
- `pprofextension`
### Exporters
- `loggingexporter`
- `otlpexporter`
- `otlphttpexporter`
### Processors
- `batchprocessor`
- `memorylimiterprocessor`
- `filterprocessor`
- `resourcedetectionprocessor`
- `metricstransformprocessor`
- `timestampprocessor`

