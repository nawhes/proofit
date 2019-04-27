echo "###[admin.app.com] install account chaincode to admin.app.com"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7051" admin.app.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/chaincode/account

echo "###[admin.app.com] install univ chaincode to admin.app.com"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7051" admin.app.com peer chaincode install -n univ -v beta0 -l node -p /etc/hyperledger/chaincode/univ

echo "###[admin.app.com] install account chaincode to app.app.com"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/chaincode/account

echo "###[admin.app.com] install univ chaincode to app.app.com"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer chaincode install -n univ -v beta0 -l node -p /etc/hyperledger/chaincode/univ

echo "###[admin.app.com] install account chaincode to recruit.app.com"
docker exec -e "CORE_PEER_ADDRESS=recruit.app.com:7051" admin.app.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/chaincode/account

echo "###[admin.app.com] install univ chaincode to recruit.app.com"
docker exec -e "CORE_PEER_ADDRESS=recruit.app.com:7051" admin.app.com peer chaincode install -n univ -v beta0 -l node -p /etc/hyperledger/chaincode/univ

echo "###[admin.univ.com] install account chaincode to admin.univ.com"
docker exec -e "CORE_PEER_ADDRESS=admin.univ.com:7051" admin.univ.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/chaincode/account

echo "###[admin.univ.com] install univ chaincode to admin.univ.com"
docker exec -e "CORE_PEER_ADDRESS=admin.univ.com:7051" admin.univ.com peer chaincode install -n univ -v beta0 -l node -p /etc/hyperledger/chaincode/univ


echo "###[admin.univ.com] install account chaincode to smu.univ.com"
docker exec -e "CORE_PEER_ADDRESS=smu.univ.com:7051" admin.univ.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/chaincode/account

echo "###[admin.univ.com] install univ chaincode to smu.univ.com"
docker exec -e "CORE_PEER_ADDRESS=smu.univ.com:7051" admin.univ.com peer chaincode install -n univ -v beta0 -l node -p /etc/hyperledger/chaincode/univ

