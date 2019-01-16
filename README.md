# 1 Preparing Digital Ocean Droplets

## 1.1 Manager
1. Create Droplet
2. ssh root@**DROPLET_IP**

### 1.1.1 Install docker
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
```
```bash
sh get-docker.sh
```

### 1.1.2 Install REX-Ray plugin
- Get **DO_API_TOKEN**: https://www.digitalocean.com/docs/api/create-personal-access-token/
- https://rexray.readthedocs.io/en/stable/user-guide/schedulers/docker/plug-ins/digitalocean/
```bash
docker plugin install rexray/dobs \
 DOBS_REGION=sfo2 \ 
 DOBS_TOKEN=DO_API_TOKEN \
 DOBS_CONVERTUNDERSCORES=true
```

### 1.1.3 Init swarm
```bash
docker swarm init --advertise-addr DROPLET_IP
```


## 1.2 Worker
1. Create Droplet
2. ssh root@**DROPLET_IP**

### 1.2.1 Install docker
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
```
```bash
sh get-docker.sh
```

### 1.2.2 Install REX-Ray plugin
- Get **DO_API_TOKEN**: https://www.digitalocean.com/docs/api/create-personal-access-token/
- https://rexray.readthedocs.io/en/stable/user-guide/schedulers/docker/plug-ins/digitalocean/
```bash
docker plugin install rexray/dobs \
 DOBS_REGION=sfo2 \ 
 DOBS_TOKEN=DO_API_TOKEN \
 DOBS_CONVERTUNDERSCORES=true
```

### 1.2.3 Add droplet to the swarm

**Run next command on the manager for seeing command for join worker to the swarm:** 

```bash
docker swarm join-token worker
```

**This is command from previous output!!!**
```bash
docker swarm join --token JOIN_TOKEN MANAGER_IP:2377
```

# 2 Running project

## 2.1 Clone project repository on the manager
```bash
mkdir -p ~/swarm
cd ~/swarm
git clone https://github.com/breitsmiley/rexray-docker-swarm.git
```

## 2.2 Start swarm

```bash
./sh/init-swarm-secrets.sh
```

```bash
docker stack deploy --compose-file docker-stack.yml stackdemo
```

