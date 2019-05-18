set -e

if [ "$(whoami)" = "root" ]
then

    export MSYS_NO_PATHCONV=1

    echo "Proofit network down"
    docker-compose -f docker-compose.yaml down

    echo "Proofit network up with 5 organizations and more 20 peers"
    docker-compose -f docker-compose.yaml up -d server.ca.com admin.ca.com zookeeper.ca.com orderer.ca.com kafka.ca.com appdb skdb smudb qnetdb toeicdb

    sleep 10

    docker-compose -f docker-compose.yaml up -d admin.app.com app.app.com admin.recruit.com sk.recruit.com admin.univ.com smu.univ.com admin.license.com qnet.license.com admin.language.com toeic.language.com

    ./z_createchannel.sh
    ./z_joinchannel.sh
    ./z_setanchorpeer.sh
else
	echo "please run with root permission"
	echo "this script need "
fi