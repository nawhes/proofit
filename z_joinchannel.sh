echo "###[admin.app.com] is joining admin.app.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7151" admin.app.com peer channel join -b account.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] is joining admin.app.com to proofit channel"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7151" admin.app.com peer channel join -b proofit.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] is joining admin.app.com to univ channel"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7151" admin.app.com peer channel join -b univ.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] is joining admin.app.com to license channel"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7151" admin.app.com peer channel join -b license.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] is joining admin.app.com to language channel"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7151" admin.app.com peer channel join -b language.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.app.com] is joining app.app.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer channel join -b account.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] is joining app.app.com to proofit channel"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer channel join -b proofit.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] is joining app.app.com to univ channel"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer channel join -b univ.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] is joining app.app.com to license channel"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer channel join -b license.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] is joining app.app.com to language channel"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer channel join -b language.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com



echo "###[admin.recruit.com] is joining admin.recruit.com to proofit channel"
docker exec -e "CORE_PEER_ADDRESS=admin.recruit.com:8151" admin.recruit.com peer channel join -b proofit.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.recruit.com] is joining sk.recruit.com to proofit channel"
docker exec -e "CORE_PEER_ADDRESS=sk.recruit.com:8051" admin.recruit.com peer channel join -b proofit.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com



echo "###[admin.univ.com] is joining admin.univ.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=admin.univ.com:9151" admin.univ.com peer channel join -b account.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.univ.com] is joining admin.univ.com to proofit channel"
docker exec -e "CORE_PEER_ADDRESS=admin.univ.com:9151" admin.univ.com peer channel join -b proofit.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.univ.com] is joining admin.univ.com to univ channel"
docker exec -e "CORE_PEER_ADDRESS=admin.univ.com:9151" admin.univ.com peer channel join -b univ.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.univ.com] is joining smu.univ.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=smu.univ.com:9051" admin.univ.com peer channel join -b account.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.univ.com] is joining smu.univ.com to proofit channel"
docker exec -e "CORE_PEER_ADDRESS=smu.univ.com:9051" admin.univ.com peer channel join -b proofit.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.univ.com] is joining smu.univ.com to univ channel"
docker exec -e "CORE_PEER_ADDRESS=smu.univ.com:9051" admin.univ.com peer channel join -b univ.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.license.com] is joining admin.license.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=admin.license.com:10151" admin.license.com peer channel join -b account.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.license.com] is joining admin.license.com to proofit channel"
docker exec -e "CORE_PEER_ADDRESS=admin.license.com:10151" admin.license.com peer channel join -b proofit.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.license.com] is joining admin.license.com to license channel"
docker exec -e "CORE_PEER_ADDRESS=admin.license.com:10151" admin.license.com peer channel join -b license.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.license.com] is joining qnet.license.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=qnet.license.com:10051" admin.license.com peer channel join -b account.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.license.com] is joining qnet.license.com to proofit channel"
docker exec -e "CORE_PEER_ADDRESS=qnet.license.com:10051" admin.license.com peer channel join -b proofit.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.license.com] is joining qnet.license.com to license channel"
docker exec -e "CORE_PEER_ADDRESS=qnet.license.com:10051" admin.license.com peer channel join -b license.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com



echo "###[admin.language.com] is joining admin.language.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=admin.language.com:11151" admin.language.com peer channel join -b account.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.language.com] is joining admin.language.com to proofit channel"
docker exec -e "CORE_PEER_ADDRESS=admin.language.com:11151" admin.language.com peer channel join -b proofit.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.language.com] is joining admin.language.com to language channel"
docker exec -e "CORE_PEER_ADDRESS=admin.language.com:11151" admin.language.com peer channel join -b language.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.language.com] is joining toeic.language.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=toeic.language.com:11051" admin.language.com peer channel join -b account.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.language.com] is joining toeic.language.com to proofit channel"
docker exec -e "CORE_PEER_ADDRESS=toeic.language.com:11051" admin.language.com peer channel join -b proofit.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.language.com] is joining toeic.language.com to language channel"
docker exec -e "CORE_PEER_ADDRESS=toeic.language.com:11051" admin.language.com peer channel join -b language.block -o orderer.ca.com:7050 --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com
