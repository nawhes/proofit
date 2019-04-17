echo "###[admin.app.com] instantiate account chaincode"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7051" admin.app.com peer chaincode instantiate -n account -v beta0 -C account -c '{"Args":["account:instantiate"]}'

echo "###[admin.app.com] instantiate univ chaincode"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7051" admin.app.com peer chaincode instantiate -n univ -v beta0 -C account -c '{"Args":["univ:instantiate"]}'



echo "###[admin.app.com] install univ chaincode to admin.app.com"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7051" admin.app.com peer chaincode install -n univ -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/univ

echo "###[admin.app.com] install license chaincode to admin.app.com"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7051" admin.app.com peer chaincode install -n license -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/license

echo "###[admin.app.com] install language chaincode to admin.app.com"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7051" admin.app.com peer chaincode install -n language -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/language


echo "###[admin.app.com] install account chaincode to app.app.com"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/account

echo "###[admin.app.com] install univ chaincode to app.app.com"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer chaincode install -n univ -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/univ

echo "###[admin.app.com] install license chaincode to app.app.com"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer chaincode install -n license -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/license

echo "###[admin.app.com] install language chaincode to app.app.com"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer chaincode install -n language -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/language


echo "###[admin.app.com] install account chaincode to recruit.app.com"
docker exec -e "CORE_PEER_ADDRESS=recruit.app.com:7051" admin.app.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/account

echo "###[admin.app.com] install univ chaincode to recruit.app.com"
docker exec -e "CORE_PEER_ADDRESS=recruit.app.com:7051" admin.app.com peer chaincode install -n univ -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/univ

echo "###[admin.app.com] install license chaincode to recruit.app.com"
docker exec -e "CORE_PEER_ADDRESS=recruit.app.com:7051" admin.app.com peer chaincode install -n license -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/license

echo "###[admin.app.com] install language chaincode to recruit.app.com"
docker exec -e "CORE_PEER_ADDRESS=recruit.app.com:7051" admin.app.com peer chaincode install -n language -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/language


echo "###[admin.univ.com] install account chaincode to admin.univ.com"
docker exec -e "CORE_PEER_ADDRESS=admin.univ.com:7051" admin.univ.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/account

echo "###[admin.univ.com] install univ chaincode to admin.univ.com"
docker exec -e "CORE_PEER_ADDRESS=admin.univ.com:7051" admin.univ.com peer chaincode install -n univ -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/univ


echo "###[admin.univ.com] install account chaincode to smu.univ.com"
docker exec -e "CORE_PEER_ADDRESS=smu.univ.com:7051" admin.univ.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/account

echo "###[admin.univ.com] install univ chaincode to smu.univ.com"
docker exec -e "CORE_PEER_ADDRESS=smu.univ.com:7051" admin.univ.com peer chaincode install -n univ -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/univ


echo "###[admin.license.com] install account chaincode to admin.license.com"
docker exec -e "CORE_PEER_ADDRESS=admin.license.com:7051" admin.license.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/account

echo "###[admin.license.com] install license chaincode to admin.license.com"
docker exec -e "CORE_PEER_ADDRESS=admin.license.com:7051" admin.license.com peer chaincode install -n license -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/license


echo "###[admin.license.com] install account chaincode to qnet.license.com"
docker exec -e "CORE_PEER_ADDRESS=qnet.license.com:7051" qnet.license.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/account

echo "###[admin.license.com] install license chaincode to qnet.license.com"
docker exec -e "CORE_PEER_ADDRESS=qnet.license.com:7051" qnet.license.com peer chaincode install -n license -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/license


echo "###[admin.language.com] install account chaincode to admin.language.com"
docker exec -e "CORE_PEER_ADDRESS=admin.language.com:7051" admin.language.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/account

echo "###[admin.language.com] install language chaincode to admin.language.com"
docker exec -e "CORE_PEER_ADDRESS=admin.language.com:7051" admin.language.com peer chaincode install -n language -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/language


echo "###[admin.language.com] install account chaincode to smu.language.com"
docker exec -e "CORE_PEER_ADDRESS=smu.language.com:7051" qnet.language.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/account

echo "###[admin.language.com] install language chaincode to smu.language.com"
docker exec -e "CORE_PEER_ADDRESS=smu.language.com:7051" qnet.language.com peer chaincode install -n language -v beta0 -l node -p /etc/hyperledger/fabric-ca-client/language
