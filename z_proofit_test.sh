set -e

export MSYS_NO_PATHCONV=1

docker-compose -f docker-compose.yaml down

docker-compose -f docker-compose.yaml up -d server.ca.com admin.ca.com orderer.ca.com zookeeper.ca.com kafka.ca.com admin.app.com app.app.com appdb recruit.app.com recruitdb admin.univ.com smu.univ.com smudb

export FABRIC_START_TIMEOUT=30
echo ${FABRIC_START_TIMEOUT}
sleep ${FABRIC_START_TIMEOUT}