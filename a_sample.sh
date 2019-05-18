docker exec admin.app.com peer chaincode invoke -n account -C account -c '{"Args":["create","nawhes330@gmail.com","1"]}' --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com 


docker exec smu.univ.com peer chaincode invoke -n univ -C univ -c '{"Args":["input","nawhes330@gmail.com","1","smu.univ.com","{\"ss\":{\"sss\":\"ssss\"}}"]}' --tls --clientauth --cafile /etc/hyperledger/fabric/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric/tls/server.crt --keyfile /etc/hyperledger/fabric/tls/server.key --ordererTLSHostnameOverride orderer.ca.com 

docker exec qnet.license.com peer chaincode invoke -n license -C license -c '{"Args":["input","nawhes330@gmail.com","1","qnet.license.com","{\"a\":\"b\"}"]}' --tls --clientauth --cafile /etc/hyperledger/fabric/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric/tls/server.crt --keyfile /etc/hyperledger/fabric/tls/server.key --ordererTLSHostnameOverride orderer.ca.com 

docker exec toeic.language.com peer chaincode invoke -n language -C language -c '{"Args":["input","nawhes330@gmail.com","1","toeic.language.com","{\"t\":\"tt\"}"]}' --tls --clientauth --cafile /etc/hyperledger/fabric/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric/tls/server.crt --keyfile /etc/hyperledger/fabric/tls/server.key --ordererTLSHostnameOverride orderer.ca.com 


# docker exec app.app.com peer chaincode invoke -n proofit -C proofit --peerAddresses '[app.app.com:7051,smu.univ.com:9051]' -c '{"Args":["create","nawhes330@gmail.com","1"]}' --tls --clientauth --cafile /etc/hyperledger/fabric/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric/tls/server.crt --keyfile /etc/hyperledger/fabric/tls/server.key --ordererTLSHostnameOverride orderer.ca.com 
