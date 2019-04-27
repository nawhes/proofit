echo "###[admin.app.com] set AnchorPeers to account channel"
docker exec admin.app.com peer channel update -o orderer.ca.com:7050 -c account -f appAnchorPeerAccount.tx #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] set AnchorPeers to univ channel"
docker exec admin.app.com peer channel update -o orderer.ca.com:7050 -c univ -f appAnchorPeerUniv.tx #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] set AnchorPeers to license channel"
#docker exec admin.app.com peer channel update -o orderer.ca.com:7050 -c license -f appAnchorPeerLicense.tx #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] set AnchorPeers to language channel"
#docker exec admin.app.com peer channel update -o orderer.ca.com:7050 -c language -f appAnchorPeerLanguage.tx #--certfile PATH --cafile PATH --tls

echo "###[admin.univ.com] set AnchorPeers to account channel"
docker exec admin.univ.com peer channel update -o orderer.ca.com:7050 -c account -f univAnchorPeerAccount.tx #--certfile PATH --cafile PATH --tls

echo "###[admin.univ.com] set AnchorPeers to univ channel"
docker exec admin.univ.com peer channel update -o orderer.ca.com:7050 -c univ -f univAnchorPeerUniv.tx #--certfile PATH --cafile PATH --tls

echo "###[admin.license.com] set AnchorPeers to account channel"
#docker exec admin.license.com peer channel update -o orderer.ca.com:7050 -c account -f licenseAnchorPeerAccount.tx #--certfile PATH --cafile PATH --tls

echo "###[admin.license.com] set AnchorPeers to license channel"
#docker exec admin.license.com peer channel update -o orderer.ca.com:7050 -c license -f licenseAnchorPeerLicense.tx #--certfile PATH --cafile PATH --tls

echo "###[admin.language.com] set AnchorPeers to account channel"
#docker exec admin.language.com peer channel update -o orderer.ca.com:7050 -c account -f languageAnchorPeerAccount.tx #--certfile PATH --cafile PATH --tls

echo "###[admin.language.com] set AnchorPeers to language channel"
#docker exec admin.language.com peer channel update -o orderer.ca.com:7050 -c language -f languageAnchorPeerLanguage.tx #--certfile PATH --cafile PATH --tls

