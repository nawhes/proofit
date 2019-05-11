set -e

export MSYS_NO_PATHCONV=1

echo "Proofit network down"
docker-compose -f docker-compose.yaml down

echo "Proofit network up with 5 organizations and blah"
docker-compose -f docker-compose2.yaml up -d server.ca.com admin.ca.com

sleep 10

docker-compose -f docker-compose2.yaml up -d admin.app.com app.app.com admin.recruit.com sk.recruit.com admin.univ.com smu.univ.com admin.license.com qnet.license.com admin.language.com toeic.language.com
