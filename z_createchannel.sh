set -e

if [ "$(whoami)" = "root" ]
then

	echo "###[admin.app.com] create account channel"
	docker exec admin.app.com peer channel create -o orderer.ca.com:7050 -c account -f account.tx #--certfile PATH --cafile PATH --tls
	cp ./app/admin.app.com/fabric-ca-client/account.block ./univ/admin.univ.com/fabric-ca-client/
	cp ./app/admin.app.com/fabric-ca-client/account.block ./qualify/admin.qualify.com/fabric-ca-client/
	cp ./app/admin.app.com/fabric-ca-client/account.block ./language/admin.language.com/fabric-ca-client/

	echo "###[admin.app.com] create univ channel"
	docker exec admin.app.com peer channel create -o orderer.ca.com:7050 -c univ -f univ.tx #--certfile PATH --cafile PATH --tls
	cp ./app/admin.app.com/fabric-ca-client/univ.block ./univ/admin.univ.com/fabric-ca-client/
	

	echo "###[admin.app.com] create qualify channel"
	docker exec admin.app.com peer channel create -o orderer.ca.com:7050 -c qualify -f qualify.tx #--certfile PATH --cafile PATH --tls
	cp ./app/admin.app.com/fabric-ca-client/qualify.block ./qualify/admin.qualify.com/fabric-ca-client/

	echo "###[admin.app.com] create language channel"
	docker exec admin.app.com peer channel create -o orderer.ca.com:7050 -c language -f language.tx #--certfile PATH --cafile PATH --tls
	cp ./app/admin.app.com/fabric-ca-client/language.block ./language/admin.language.com/fabric-ca-client/

else
	echo "please run with root permission"
	echo "this script need "
fi
