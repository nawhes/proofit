echo "###[admin.app.com] install account chaincode to admin.app.com"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7151" admin.app.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/chaincode/account --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] install proofit chaincode to admin.app.com"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7151" admin.app.com peer chaincode install -n proofit -v beta0 -l node -p /etc/hyperledger/chaincode/proofit --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] install univ chaincode to admin.app.com"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7151" admin.app.com peer chaincode install -n univ -v beta0 -l node -p /etc/hyperledger/chaincode/univ --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] install license chaincode to admin.app.com"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7151" admin.app.com peer chaincode install -n license -v beta0 -l node -p /etc/hyperledger/chaincode/license --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] install language chaincode to admin.app.com"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7151" admin.app.com peer chaincode install -n language -v beta0 -l node -p /etc/hyperledger/chaincode/language --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.app.com] install account chaincode to app.app.com"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/chaincode/account --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] install proofit chaincode to app.app.com"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer chaincode install -n proofit -v beta0 -l node -p /etc/hyperledger/chaincode/proofit --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] install univ chaincode to app.app.com"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer chaincode install -n univ -v beta0 -l node -p /etc/hyperledger/chaincode/univ --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] install license chaincode to app.app.com"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer chaincode install -n license -v beta0 -l node -p /etc/hyperledger/chaincode/license --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] install language chaincode to app.app.com"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer chaincode install -n language -v beta0 -l node -p /etc/hyperledger/chaincode/language --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.recruit.com] install proofit chaincode to admin.recruit.com"
docker exec -e "CORE_PEER_ADDRESS=admin.recruit.com:8151" admin.recruit.com peer chaincode install -n proofit -v beta0 -l node -p /etc/hyperledger/chaincode/proofit --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.recruit.com] install proofit chaincode to sk.license.com"
docker exec -e "CORE_PEER_ADDRESS=sk.recruit.com:8051" admin.recruit.com peer chaincode install -n proofit -v beta0 -l node -p /etc/hyperledger/chaincode/proofit --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.univ.com] install account chaincode to admin.univ.com"
docker exec -e "CORE_PEER_ADDRESS=admin.univ.com:9151" admin.univ.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/chaincode/account --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.univ.com] install proofit chaincode to admin.univ.com"
docker exec -e "CORE_PEER_ADDRESS=admin.univ.com:9151" admin.univ.com peer chaincode install -n proofit -v beta0 -l node -p /etc/hyperledger/chaincode/proofit --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.univ.com] install univ chaincode to admin.univ.com"
docker exec -e "CORE_PEER_ADDRESS=admin.univ.com:9151" admin.univ.com peer chaincode install -n univ -v beta0 -l node -p /etc/hyperledger/chaincode/univ --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.univ.com] install account chaincode to smu.univ.com"
docker exec -e "CORE_PEER_ADDRESS=smu.univ.com:9051" admin.univ.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/chaincode/account --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.univ.com] install proofit chaincode to smu.univ.com"
docker exec -e "CORE_PEER_ADDRESS=smu.univ.com:9051" admin.univ.com peer chaincode install -n proofit -v beta0 -l node -p /etc/hyperledger/chaincode/proofit --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.univ.com] install univ chaincode to smu.univ.com"
docker exec -e "CORE_PEER_ADDRESS=smu.univ.com:9051" admin.univ.com peer chaincode install -n univ -v beta0 -l node -p /etc/hyperledger/chaincode/univ --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.license.com] install account chaincode to admin.license.com"
docker exec -e "CORE_PEER_ADDRESS=admin.license.com:10151" admin.license.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/chaincode/account --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.license.com] install proofit chaincode to admin.license.com"
docker exec -e "CORE_PEER_ADDRESS=admin.license.com:10151" admin.license.com peer chaincode install -n proofit -v beta0 -l node -p /etc/hyperledger/chaincode/proofit --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.license.com] install license chaincode to admin.license.com"
docker exec -e "CORE_PEER_ADDRESS=admin.license.com:10151" admin.license.com peer chaincode install -n license -v beta0 -l node -p /etc/hyperledger/chaincode/license --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.license.com] install account chaincode to qnet.license.com"
docker exec -e "CORE_PEER_ADDRESS=qnet.license.com:10051" admin.license.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/chaincode/account --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.license.com] install proofit chaincode to qnet.license.com"
docker exec -e "CORE_PEER_ADDRESS=qnet.license.com:10051" admin.license.com peer chaincode install -n proofit -v beta0 -l node -p /etc/hyperledger/chaincode/proofit --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.license.com] install license chaincode to qnet.license.com"
docker exec -e "CORE_PEER_ADDRESS=qnet.license.com:10051" admin.license.com peer chaincode install -n license -v beta0 -l node -p /etc/hyperledger/chaincode/license --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.language.com] install account chaincode to admin.language.com"
docker exec -e "CORE_PEER_ADDRESS=admin.language.com:11151" admin.language.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/chaincode/account --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.language.com] install proofit chaincode to admin.language.com"
docker exec -e "CORE_PEER_ADDRESS=admin.language.com:11151" admin.language.com peer chaincode install -n proofit -v beta0 -l node -p /etc/hyperledger/chaincode/proofit --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.language.com] install language chaincode to admin.language.com"
docker exec -e "CORE_PEER_ADDRESS=admin.language.com:11151" admin.language.com peer chaincode install -n language -v beta0 -l node -p /etc/hyperledger/chaincode/language --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.language.com] install account chaincode to toeic.language.com"
docker exec -e "CORE_PEER_ADDRESS=toeic.language.com:11051" admin.language.com peer chaincode install -n account -v beta0 -l node -p /etc/hyperledger/chaincode/account --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.language.com] install proofit chaincode to toeic.language.com"
docker exec -e "CORE_PEER_ADDRESS=toeic.language.com:11051" admin.language.com peer chaincode install -n proofit -v beta0 -l node -p /etc/hyperledger/chaincode/proofit --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.language.com] install language chaincode to toeic.language.com"
docker exec -e "CORE_PEER_ADDRESS=toeic.language.com:11051" admin.language.com peer chaincode install -n language -v beta0 -l node -p /etc/hyperledger/chaincode/language --tls --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com



echo "###[admin.app.com] instantiate account chaincode"
docker exec admin.app.com peer chaincode instantiate -n account -v beta0 -C account -c '{"Args":["account:instantiate"]}' -P "OR('app.member')" --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com 

echo "###[admin.univ.com] instantiate proofit chaincode"
docker exec admin.univ.com peer chaincode instantiate -n proofit -v beta0 -C proofit -c '{"Args":["proofit:instantiate"]}' -P "AND('app.member',OR('univ.member','license.member','language.member'))" --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com 


echo "###[admin.univ.com] instantiate univ chaincode"
docker exec admin.univ.com peer chaincode instantiate -n univ -v beta0 -C univ -c '{"Args":["univ:instantiate"]}' -P "OR('univ.member')" --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com 


echo "###[admin.license.com] instantiate license chaincode"
docker exec admin.license.com peer chaincode instantiate -n license -v beta0 -C license -c '{"Args":["license:instantiate"]}' -P "OR('license.member')" --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com 


echo "###[admin.language.com] instantiate language chaincode"
docker exec admin.app.com peer chaincode instantiate -n language -v beta0 -C language -c '{"Args":["language:instantiate"]}' -P "OR('language.member')" --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com 
