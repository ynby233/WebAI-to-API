# GHCR Docker Image

This fork publishes a NAS-friendly Docker image to:

```text
ghcr.io/ynby233/webai-to-api:latest
```

The workflow also publishes immutable rollback tags:

```text
ghcr.io/ynby233/webai-to-api:sha-<commit>
```

## Runtime Notes

- Port: `6969`
- Runtime config file: `/app/config.conf`
- Do not bake `config.conf`, `.env`, Gemini cookies, or browser profiles into the image.
- Mount `config.conf` from NAS local storage when deploying.

Example Docker volume mapping:

```text
/volume1/docker/webai-to-api/config.conf:/app/config.conf
```

Example environment variables:

```text
PYTHONPATH=/app/src
ENVIRONMENT=production
```

For personal Gemini cookie use, prefer one worker to avoid multiple processes writing the same config file concurrently.