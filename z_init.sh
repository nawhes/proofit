set -e

if [ "$(whoami)" = "root" ]
then
	docker rm -vf $(docker ps -aq)

	sudo rm -rf ./ca/orderer.ca.com/production
	sudo mkdir -p ./ca/orderer.ca.com/production

	sudo rm -rf ./app/admin.app.com/production
	sudo mkdir -p ./app/admin.app.com/production

        sudo rm -rf ./app/app.app.com/production
	sudo mkdir -p ./app/app.app.com/production

	sudo rm -rf ./recruit/admin.recruit.com/production 
	sudo mkdir -p ./recruit/admin.recruit.com/production

	sudo rm -rf ./recruit/sk.recruit.com/production
	sudo mkdir -p ./recruit/sk.recruit.com/production

	sudo rm -rf ./univ/admin.univ.com/production 
	sudo mkdir -p ./univ/admin.univ.com/production

	sudo rm -rf ./univ/smu.univ.com/production
	sudo mkdir -p ./univ/smu.univ.com/production
else
	echo "please run with root permission"
	echo "this script need "
fi
