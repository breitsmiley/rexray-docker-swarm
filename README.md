## Preparing Digital Ocean Droplet
1. Create Droplet
2. ssh root@**DROPLET_IP**

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
```
```bash
sh get-docker.sh
```

## Install REX-Ray plugin
- Get **DO_API_TOKEN**: https://www.digitalocean.com/docs/api/create-personal-access-token/


```bash
docker plugin install rexray/dobs DOBS_REGION=sfo2 DOBS_TOKEN=DO_API_TOKEN
```


## Start swarm
```bash
docker swarm init --advertise-addr DROPLET_IP
```

```bash
./sh/init-swarm-secrets.sh
```

```bash
docker stack deploy --compose-file docker-stack.yml stackdemo
```

