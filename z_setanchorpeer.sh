echo "###[admin.app.com] set AnchorPeers to account channel"
docker exec admin.app.com peer channel update -o orderer.ca.com:7050 -c account -f appAnchorPeerAccount.tx #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] set AnchorPeers to univ channel"
docker exec admin.app.com peer channel update -o orderer.ca.com:7050 -c univ -f appAnchorPeerUniv.tx #--certfile PATH --cafile PATH --tls

echo "###[admin.univ.com] set AnchorPeers to univ channel"
docker exec admin.univ.com peer channel update -o orderer.ca.com:7050 -c univ -f univAnchorPeerUniv.tx #--certfile PATH --cafile PATH --tls


