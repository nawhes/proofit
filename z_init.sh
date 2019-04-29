set -e

if [ "$(whoami)" = "root" ]
then

	echo "###[admin.app.com] create account channel"
	sudo rm -rf ./ca/orderer.ca.com/production/chains
	sudo rm -rf ./ca/orderer.ca.com/production/index

	sudo rm -rf ./app/admin.app.com/production/chaincodes
   	sudo rm -rf ./app/admin.app.com/production/ledgersData/   
	sudo rm -rf ./app/admin.app.com/production/transientStore/

	sudo rm -rf ./app/app.app.com/production/chaincodes ./app/app.app.com/production/ledgersData ./app/app.app.com/production/transientStore

	sudo rm -rf ./app/recruit.app.com/production
	sudo mkdir -p ./app/recruit.app.com/production

	sudo rm -rf ./univ/admin.univ.com/production ./univ/smu.univ.com/production
	sudo mkdir -p ./univ/admin.univ.com/production
	sudo mkdir -p ./univ/smu.univ.com/production
else
	echo "please run with root permission"
	echo "this script need "
fi
