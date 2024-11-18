# Docker Container for autoremove-torrents

This is a simple Docker Container that runs [autoremove-torrents](https://github.com/jerrymakesjelly/autoremove-torrents) to remove torrents from your torrent client based on certain criteria. An official Docker image doesn't exist, which is why I created this.

NOTE: I am not the creator of autoremove-torrents. All credit goes to [jerrymakesjelly](https://github.com/jeerymakesjelly).

## Usage
Example Docker Compose file:
```yaml
services:
  autoremove-torrents:
    container_name: autoremove-torrents
    image: ghcr.io/nelsondane/autoremove-torrents:latest
    environment:
      CRON_SCHEDULE=* * * * *
    volumes:
      - ./config.yml:/app/config.yml
      - ./logs:/app/logs
```

Setup your `config.yml` file as described in the [autoremove-torrents documentation](https://autoremove-torrents.readthedocs.io/en/latest/intro.html). Set your cron expression in the `CRON_SCHEDULE` environment variable.
