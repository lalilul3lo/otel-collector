# Set the base image to the specific version of golang
FROM --platform=linux/amd64 golang:1.19-bullseye as builder

# Set the working directory in the container
WORKDIR /app

# Install OpenTelemetry Collector Builder
RUN go install go.opentelemetry.io/collector/cmd/builder@v0.81.0

# Copy the builder config
COPY ./builder_config.yaml .

# Build the application
RUN builder --config=builder_config.yaml --output-path=. --name="core-otel-collector"

# Second stage to install ca-certificates
FROM alpine:latest as certs
RUN apk --update add ca-certificates

# Final stage
FROM --platform=linux/amd64 ubuntu:21.04

WORKDIR /app

# Copy the binary executable from builder stage
COPY --from=builder /app/core-otel-collector /app/core-otel-collector

# Copy the CA certificates from the certs stage
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

# Expose ports
EXPOSE 4317 4318

# Run the binary executable
CMD ["/app/core-otel-collector", "--config=/app/otel_config.yaml"]

