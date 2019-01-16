#!/usr/bin/env bash
SWARM_SECRETS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../docker/_swarm/secrets" && pwd )"
RUN_ENV="preprod"


echo "[START] - Init SWARM secrets"
echo "-----------------------------"

# rexray-mysql-db
#------------------------------------------------
printf "rexray" | docker secret create rexrayMysqlDb-MYSQL_DATABASE-v1 -
printf "rexray" | docker secret create rexrayMysqlDb-MYSQL_USER-v1 -
printf "rexray" | docker secret create rexrayMysqlDb-MYSQL_PASSWORD-v1 -
printf "root" | docker secret create rexrayMysqlDb-MYSQL_ROOT_PASSWORD-v1 -

echo "-----------------------------"
echo "[DONE] - Init SWARM secrets"


