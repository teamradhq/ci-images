# CICD Images

This repository contains Docker images for use in CI/CD pipelines. Images are built and published by GitHub Actions to the GitHub Container Registry (GHCR).

## Where images are pushed

Based on `.github/workflows/docker-build.yml`, images are tagged and pushed as:

- `ghcr.io/<owner>/php-ci:<php-version>`

For this repository, the owner is `teamradhq`, so the resulting image names are:

- `ghcr.io/teamradhq/php-ci:7.4`
- `ghcr.io/teamradhq/php-ci:8.2`
- `ghcr.io/teamradhq/php-ci:8.3`
- `ghcr.io/teamradhq/php-ci:8.4`

The `<php-version>` tag comes from the build matrix in the workflow.

## Pulling the images

If the images are public, you can pull them directly. If they are private, you must authenticate to GHCR first.

### Pull specific PHP versions

Use the PHP version you want to pull as the tag:

```bash
docker pull ghcr.io/teamradhq/php-ci:8.2
docker pull ghcr.io/teamradhq/php-ci:8.3
docker pull ghcr.io/teamradhq/php-ci:8.4
docker pull ghcr.io/teamradhq/php-ci:7.4
```

Optionally, tag the pulled image with a local tag (alias) so you can reference it more easily:

```bash
docker pull ghcr.io/teamradhq/php-ci:8.3
docker tag ghcr.io/teamradhq/php-ci:8.3 php-ci:8.3
docker tag ghcr.io/teamradhq/php-ci:8.3 php-ci:local
```

Now you can reference the image by the local tag:

```bash
docker run --rm php-ci:8.3 php -v
docker run --rm php-ci:local php -v
```

### Use in a Dockerfile or CI job

In Dockerfile:

```Dockerfile
FROM ghcr.io/teamradhq/php-ci:8.3
```

In Docker Compose, CI environment, etc.

```yaml
image: ghcr.io/teamradhq/php-ci:8.3
```
