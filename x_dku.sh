docker-compose -f docker-compose.yaml up -d dku.univ.compose


echo "###[admin.univ.com] is joining dku.univ.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=dku.univ.com:9061" admin.univ.com peer channel join -b account.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.univ.com] is joining dku.univ.com to proofit channel"
docker exec -e "CORE_PEER_ADDRESS=dku.univ.com:9061" admin.univ.com peer channel join -b proofit.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.univ.com] is joining dku.univ.com to univ channel"
docker exec -e "CORE_PEER_ADDRESS=dku.univ.com:9061" admin.univ.com peer channel join -b univ.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.univ.com] install account chaincode to dku.univ.com"
docker exec -e "CORE_PEER_ADDRESS=dku.univ.com:9061" admin.univ.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/chaincode/account --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.univ.com] install proofit chaincode to dku.univ.com"
docker exec -e "CORE_PEER_ADDRESS=dku.univ.com:9061" admin.univ.com peer chaincode install -n proofit -v beta0 -l node -p /etc/hyperledger/chaincode/proofit --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.univ.com] install univ chaincode to dku.univ.com"
docker exec -e "CORE_PEER_ADDRESS=dku.univ.com:9061" admin.univ.com peer chaincode install -n univ -v beta0 -l node -p /etc/hyperledger/chaincode/univ --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com
