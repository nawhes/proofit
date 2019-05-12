echo "###[admin.app.com] set AnchorPeers to account channel"
docker exec admin.app.com peer channel update -o orderer.ca.com:7050 -c account -f appAnchorPeerAccount.tx --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] set AnchorPeers to proofit channel"
docker exec admin.app.com peer channel update -o orderer.ca.com:7050 -c proofit -f appAnchorPeerProofit.tx --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] set AnchorPeers to univ channel"
docker exec admin.app.com peer channel update -o orderer.ca.com:7050 -c univ -f appAnchorPeerUniv.tx --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] set AnchorPeers to license channel"
docker exec admin.app.com peer channel update -o orderer.ca.com:7050 -c univ -f appAnchorPeerLicense.tx --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.app.com] set AnchorPeers to language channel"
docker exec admin.app.com peer channel update -o orderer.ca.com:7050 -c univ -f appAnchorPeerLanguage.tx --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.recruit.com] set AnchorPeers to recruit channel"
docker exec admin.recruit.com peer channel update -o orderer.ca.com:7050 -c proofit -f recruitAnchorPeerProofit.tx --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.univ.com] set AnchorPeers to account channel"
docker exec admin.univ.com peer channel update -o orderer.ca.com:7050 -c account -f univAnchorPeerAccount.tx --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.univ.com] set AnchorPeers to proofit channel"
docker exec admin.univ.com peer channel update -o orderer.ca.com:7050 -c proofit -f univAnchorPeerProofit.tx --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.univ.com] set AnchorPeers to univ channel"
docker exec admin.univ.com peer channel update -o orderer.ca.com:7050 -c univ -f univAnchorPeerUniv.tx --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.license.com] set AnchorPeers to account channel"
docker exec admin.license.com peer channel update -o orderer.ca.com:7050 -c account -f licenseAnchorPeerAccount.tx  --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.license.com] set AnchorPeers to proofit channel"
docker exec admin.license.com peer channel update -o orderer.ca.com:7050 -c proofit -f licenseAnchorPeerProofit.tx  --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.license.com] set AnchorPeers to license channel"
docker exec admin.license.com peer channel update -o orderer.ca.com:7050 -c license -f licenseAnchorPeerLicense.tx  --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com


echo "###[admin.language.com] set AnchorPeers to account channel"
docker exec admin.language.com peer channel update -o orderer.ca.com:7050 -c account -f languageAnchorPeerAccount.tx  --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.language.com] set AnchorPeers to proofit channel"
docker exec admin.language.com peer channel update -o orderer.ca.com:7050 -c proofit -f languageAnchorPeerProofit.tx  --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

echo "###[admin.language.com] set AnchorPeers to language channel"
docker exec admin.language.com peer channel update -o orderer.ca.com:7050 -c language -f languageAnchorPeerLanguage.tx  --tls --clientauth --cafile /etc/hyperledger/fabric-ca-client/tls/server-ca-com-7054.crt --certfile /etc/hyperledger/fabric-ca-client/tls/server.crt --keyfile /etc/hyperledger/fabric-ca-client/tls/server.key --ordererTLSHostnameOverride orderer.ca.com

