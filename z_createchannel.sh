set -e

if [ "$(whoami)" = "root" ]
then

	echo "###[admin.app.com] create account channel"
	docker exec admin.app.com peer channel create -o orderer.ca.com:7050 -c account -f account.tx --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com
	cp ./app/admin.app.com/fabric-ca-client/account.block ./univ/admin.univ.com/fabric-ca-client/
	cp ./app/admin.app.com/fabric-ca-client/account.block ./license/admin.license.com/fabric-ca-client/
	cp ./app/admin.app.com/fabric-ca-client/account.block ./language/admin.language.com/fabric-ca-client/

	echo "###[admin.app.com] create proofit channel"
	docker exec admin.app.com peer channel create -o orderer.ca.com:7050 -c proofit -f proofit.tx --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com
	cp ./app/admin.app.com/fabric-ca-client/proofit.block ./recruit/admin.recruit.com/fabric-ca-client/
	cp ./app/admin.app.com/fabric-ca-client/proofit.block ./univ/admin.univ.com/fabric-ca-client/
	cp ./app/admin.app.com/fabric-ca-client/proofit.block ./license/admin.license.com/fabric-ca-client/
	cp ./app/admin.app.com/fabric-ca-client/proofit.block ./language/admin.language.com/fabric-ca-client/

	echo "###[admin.univ.com] create univ channel"
	docker exec admin.univ.com peer channel create -o orderer.ca.com:7050 -c univ -f univ.tx --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com
	cp ./univ/admin.univ.com/fabric-ca-client/univ.block ./app/admin.app.com/fabric-ca-client/
	
	echo "###[admin.license.com] create license channel"
	docker exec admin.license.com peer channel create -o orderer.ca.com:7050 -c license -f license.tx --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com
	cp ./license/admin.license.com/fabric-ca-client/license.block ./app/admin.app.com/fabric-ca-client/

	echo "###[admin.language.com] create language channel"
	docker exec admin.language.com peer channel create -o orderer.ca.com:7050 -c language -f language.tx --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com
	docker exec admin.language.com peer channel create -o orderer.ca.com:7050 -c language -f language.tx #--certfile PATH --cafile PATH --tls
	cp ./language/admin.language.com/fabric-ca-client/language.block ./app/admin.app.com/fabric-ca-client/
else
	echo "please run with root permission"
	echo "this script need "
fi
