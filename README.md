# wakeonlan-cron-docker

A Docker container to wake up a computer on a schedule.

## Instructions

### Vanilla Docker

```bash
docker run \
  axeleroy/wakeonlan-cron-docker:latest \
  -e TZ='Europe/Paris' \
  -e CRON='20 4 * * *' \
  -e MAC_ADDRESS=AA:BB:CC:DD:EE:FF \
  --network="host"
```

### Docker-compose
```yml
version: "3"
services:
  wake-on-lan:
    image: axeleroy/wakeonlan-cron-docker:latest
    environment:
      - TZ='Europe/Paris'
      - CRON='20 4 * * *'
      - MAC_ADDRESS=AA:BB:CC:DD:EE:FF
    networks:
      hostnet: {}

networks:
  hostnet:
    external: true
    name: host
```

### Environment variables

| Variable       | Meaning                                                                   | Example                         |
|----------------|---------------------------------------------------------------------------|---------------------------------|
| `TZ`           | Timezone                                                                  | `TZ='Europe/Paris'`             |
| `CRON`         | Cron schedule expression (tip: use [crontab.guru](https://crontab.guru/)) | `CRON='20 4 * * *'`             |
| `MAC_ADDRESS`  | Mac address of the computer you want to wake up                           | `MAC_ADDRESS=AA:BB:CC:DD:EE:FF` | 
| `BROADCAST_IP` | IP address of the subnet to broadcast the magic packet to                 | `BROADCAST_IP=192.168.0.255`    |
