set -e

export MSYS_NO_PATHCONV=1

echo "Proofit network down"
docker-compose -f docker-compose.yaml down

echo "Proofit network up with 5 organizations and blah"
docker-compose -f docker-compose.yaml up -d server.ca.com admin.ca.com zookeeper.ca.com orderer.ca.com kafka.ca.com appdb recruitdb smudb

sleep 10

docker-compose -f docker-compose.yaml up -d admin.app.com app.app.com recruit.app.com admin.univ.com smu.univ.com
