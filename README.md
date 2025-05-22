# Key2PFX

[![Create and publish a Docker image](https://github.com/thaitype/key2pfx/actions/workflows/publish-image.yml/badge.svg?branch=latest)](https://github.com/thaitype/key2pfx/actions/workflows/publish-image.yml)

**Key2PFX** is a lightweight Docker-based utility that securely converts TLS certificates (`tls.crt`, `tls.key`, `ca.crt`) from cert-manager or other certificate providers into a `.pfx` file, suitable for consumption by .NET applications.

## Pulling the Image

To use the latest production version, pull the image from GitHub Container Registry:

```sh
docker pull ghcr.io/thaitype/key2pfx:latest
```

This image is built specifically for **`linux/amd64`** architecture and is ready to be used as part of your certificate automation workflow, such as scheduled Kubernetes CronJobs before certificate expiration.

## Image Mechanism

The image contains a simple yet secure conversion mechanism built on Alpine Linux and OpenSSL. At runtime, it:

1. Reads certificate files from mounted volumes or default paths:
   - `tls.crt` – Public certificate
   - `tls.key` – Private key
   - `ca.crt` – Certificate authority chain (optional)

2. Converts them into a single `.pfx` (PKCS#12) bundle using `openssl pkcs12 -export`.

3. Outputs the resulting `.pfx` file to a configurable location, with an optional password.

All key parameters such as input paths, output location, and password are configurable via environment variables, allowing seamless integration with Kubernetes secrets and automation workflows.

## Example Usage

- [Docker Compose](examples/docker-compose/)
- [Kubernetes (on AKS)](examples/k8s-aks/)

## Development Process

Key2PFX follows a clear and controlled branching model:

- **`latest` branch**  
  This branch is automatically built and published as the `latest` image in the container registry for internal testing and integration.

## Contributors
- [Thada Wangthammang](https://github.com/mildronize/)
- [Panupog Chamsomboon](https://github.com/PanupongDeve)