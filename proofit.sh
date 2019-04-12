set -e

export MSYS_NO_PATHCONV=1

docker-compose -f docker-compose.yaml down

docker-compose -f docker-compose.yaml up -d server.ca.com admin.ca.com zookeeper.ca.com orderer.ca.com kafka.ca.com admin.app.com app.app.com appdb recruit.app.com recruitdb admin.language.com toeic.language.com toeicdb admin.qualify.com qnet.qualify.com qnetdb admin.univ.com smu.univ.com smudb

export FABRIC_START_TIMEOUT=30
echo ${FABRIC_START_TIMEOUT}
sleep ${FABRIC_START_TIMEOUT}
