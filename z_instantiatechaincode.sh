echo "###[admin.app.com] instantiate account chaincode"
docker exec admin.app.com peer chaincode instantiate -n account -v beta0 -C account -c '{"Args":["account:instantiate"]}' --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com # -P "AND('app.member','univ.member')"

echo "###[admin.app.com] instantiate proofit chaincode"
docker exec admin.app.com peer chaincode instantiate -n proofit -v beta0 -C proofit -c '{"Args":["proofit:instantiate"]}' --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com # -P "AND('app.member','univ.member')"

echo "###[admin.app.com] instantiate univ chaincode"
docker exec admin.app.com peer chaincode instantiate -n univ -v beta0 -C univ -c '{"Args":["univ:instantiate"]}' --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com # -P "AND('app.member','univ.member')"

echo "###[admin.app.com] instantiate license chaincode"
#docker exec admin.app.com peer chaincode instantiate -n license -v beta0 -C license -c '{"Args":["license:instantiate"]}' -P "AND ('license.member')"

echo "###[admin.app.com] instantiate language chaincode"
#docker exec admin.app.com peer chaincode instantiate -n language -v beta0 -C language -c '{"Args":["language:instantiate"]}' -P "AND ('language.member')"
           
