echo "###[admin.app.com] instantiate account chaincode"
docker exec admin.app.com peer chaincode instantiate -n account -v beta0 -C account -c '{"Args":["account:instantiate"]}' -P "OR('app.member')" --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com 


echo "###[admin.univ.com] instantiate univ chaincode"
docker exec admin.univ.com peer chaincode instantiate -n univ -v beta0 -C univ -c '{"Args":["univ:instantiate"]}' -P "OR('univ.member')" --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com 

echo "###[admin.univ.com] instantiate proofitUniv chaincode"
docker exec admin.univ.com peer chaincode instantiate -n proofitUniv -v beta0 -C proofit -c '{"Args":["proofitUniv:instantiate"]}' -P "OR('univ.member')" --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com 


echo "###[admin.license.com] instantiate license chaincode"
docker exec admin.license.com peer chaincode instantiate -n license -v beta0 -C license -c '{"Args":["license:instantiate"]}' -P "OR('license.member')" --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com 

echo "###[admin.license.com] instantiate proofitLicense chaincode"
docker exec admin.license.com peer chaincode instantiate -n proofitLicense -v beta0 -C proofit -c '{"Args":["proofitLicense:instantiate"]}' -P "OR('license.member')" --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com 


echo "###[admin.language.com] instantiate language chaincode"
docker exec admin.app.com peer chaincode instantiate -n language -v beta0 -C language -c '{"Args":["language:instantiate"]}' -P "OR('language.member')" --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com 

echo "###[admin.license.com] instantiate proofitLanguage chaincode"
docker exec admin.app.com peer chaincode instantiate -n proofitLanguage -v beta0 -C proofit -c '{"Args":["proofitLanguage:instantiate"]}' -P "OR('language.member')" --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com 
