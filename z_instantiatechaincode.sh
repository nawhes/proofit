echo "###[admin.app.com] instantiate account chaincode"
docker exec admin.app.com peer chaincode instantiate -n account -v beta0 -C account -c '{"Args":["account:instantiate"]}' --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com -P "OR('app.member')"

echo "###[admin.app.com] instantiate proofit chaincode"
docker exec admin.app.com peer chaincode instantiate -n proofit -v beta0 -C proofit -c '{"Args":["proofit:instantiate"]}' --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com -P "OR('app.member')"

echo "###[admin.univ.com] instantiate univ chaincode"
docker exec admin.univ.com peer chaincode instantiate -n univ -v beta0 -C univ -c '{"Args":["univ:instantiate"]}' --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com -P "OR('app.member')"

echo "###[admin.license.com] instantiate license chaincode"
docker exec admin.license.com peer chaincode instantiate -n license -v beta0 -C license -c '{"Args":["license:instantiate"]}' --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com -P "OR('app.member')"

echo "###[admin.language.com] instantiate language chaincode"
docker exec admin.language.com peer chaincode language -n license -v beta0 -C language -c '{"Args":["language:instantiate"]}' --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com -P "OR('app.member')"