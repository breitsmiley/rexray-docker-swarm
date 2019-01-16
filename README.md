## Preparing Digital Ocean Droplet
1. Create Droplet
2. ssh root@**DROPLET_IP**

#### Install docker
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
```
```bash
sh get-docker.sh
```

#### Init swarm
```bash
docker swarm init --advertise-addr DROPLET_IP
```

#### Install REX-Ray plugin
- Get **DO_API_TOKEN**: https://www.digitalocean.com/docs/api/create-personal-access-token/

```bash
docker plugin install rexray/dobs DOBS_REGION=sfo2 DOBS_TOKEN=DO_API_TOKEN
```

#### Clone project repository
```bash
mkdir -p ~/swarm
cd ~/swarm
git clone https://github.com/breitsmiley/rexray-docker-swarm.git
```


## Start swarm

```bash
./sh/init-swarm-secrets.sh
```

```bash
docker stack deploy --compose-file docker-stack.yml stackdemo
```

