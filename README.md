# wakeonlan-cron-docker

A Docker container to wake up a computer on a schedule.

[![Docker Hub](https://img.shields.io/docker/v/axeleroy/wakeonlan-cron-docker?sort=semver&logo=docker)](https://hub.docker.com/r/axeleroy/wakeonlan-cron-docker/tags)
[![Docker Hub](https://img.shields.io/docker/pulls/axeleroy/wakeonlan-cron-docker?logo=docker)](https://hub.docker.com/r/axeleroy/wakeonlan-cron-docker/tags)
[![GitHub release](https://img.shields.io/github/v/release/axeleroy/wakeonlan-cron-docker?logo=github&logoColor=959DA5)](https://github.com/axeleroy/wakeonlan-cron-docker/packages)

[![GitHub last commit](https://img.shields.io/github/last-commit/axeleroy/wakeonlan-cron-docker?logo=github&logoColor=959DA5)](https://github.com/axeleroy/wakeonlan-cron-docker/commits/main)
[![Docker build](https://github.com/axeleroy/wakeonlan-cron-docker/actions/workflows/publish.yml/badge.svg)](https://github.com/axeleroy/wakeonlan-cron-docker/actions/workflows/publish.yml)

## Instructions

### Vanilla Docker

```bash
docker run \
  ghcr.io/axeleroy/wakeonlan-cron-docker:latest \
  -e "TZ=Europe/Paris" \
  -e "CRON=20 4 * * *" \
  -e "MAC_ADDRESS=AA:BB:CC:DD:EE:FF" \
  --network="host"
```

### Docker-compose
```yml
version: "2.1"
services:
  wake-on-lan:
    image: ghcr.io/axeleroy/wakeonlan-cron-docker:latest
    environment:
      - TZ=Europe/Paris
      - CRON=20 4 * * *
      - MAC_ADDRESS=AA:BB:CC:DD:EE:FF
    network_mode: host
```

### Environment variables

| Variable         | Meaning                                                                   | Example                         |
|------------------|---------------------------------------------------------------------------|---------------------------------|
| `TZ`             | Timezone                                                                  | `TZ=Europe/Paris`               |
| `CRON`           | Cron schedule expression (tip: use [crontab.guru](https://crontab.guru/)) | `CRON=20 4 * * *`               |
| `MAC_ADDRESS`    | Mac address of the computer you want to wake up                           | `MAC_ADDRESS=AA:BB:CC:DD:EE:FF` | 
| `BROADCAST_IP`   | IP address of the subnet to broadcast the magic packet to                 | `BROADCAST_IP=192.168.0.255`    |
| `CRON_LOG_LEVEL` | Log level of `crond`. Goes from 0 (most verbose) to 8 (default)           | `CRON_LOG_LEVEL=2`              |
