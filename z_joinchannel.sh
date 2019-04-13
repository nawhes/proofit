echo "###[admin.app.com] is joining admin.app.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7051" admin.app.com peer channel join -b account.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining admin.app.com to univ channel"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7051" admin.app.com peer channel join -b univ.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining admin.app.com to qualify channel"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7051" admin.app.com peer channel join -b qualify.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining admin.app.com to language channel"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7051" admin.app.com peer channel join -b language.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining app.app.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer channel join -b account.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining app.app.com to univ channel"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer channel join -b univ.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining app.app.com to qualify channel"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer channel join -b qualify.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining app.app.com to language channel"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer channel join -b language.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining recruit.app.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=recruit.app.com:7051" admin.app.com peer channel join -b account.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining recruit.app.com to univ channel"
docker exec -e "CORE_PEER_ADDRESS=recruit.app.com:7051" admin.app.com peer channel join -b univ.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining recruit.app.com to qualify channel"
docker exec -e "CORE_PEER_ADDRESS=recruit.app.com:7051" admin.app.com peer channel join -b qualify.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining recruit.app.com to language channel"
docker exec -e "CORE_PEER_ADDRESS=recruit.app.com:7051" admin.app.com peer channel join -b language.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.univ.com] is joining admin.univ.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=admin.univ.com:7051" admin.univ.com peer channel join -b account.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls

echo "###[admin.univ.com] is joining admin.univ.com to univ channel"
docker exec -e "CORE_PEER_ADDRESS=admin.univ.com:7051" admin.univ.com peer channel join -b univ.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tlsi

echo "###[admin.univ.com] is joining smu.univ.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=smu.univ.com:7051" admin.univ.com peer channel join -b account.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls

echo "###[admin.univ.com] is joining smu.univ.com to univ channel"
docker exec -e "CORE_PEER_ADDRESS=smu.univ.com:7051" admin.univ.com peer channel join -b univ.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls

echo "###[admin.qualify.com] is joining admin.qualify.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=admin.qualify.com:7051" admin.qualify.com peer channel join -b account.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.qualify.com] is joining admin.qualify.com to qualify channel"
docker exec -e "CORE_PEER_ADDRESS=admin.qualify.com:7051" admin.qualify.com peer channel join -b qualify.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.qualify.com] is joining qnet.qualify.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=qnet.qualify.com:7051" admin.qualify.com peer channel join -b account.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.qualify.com] is joining qnet.qualify.com to qualify channel"
docker exec -e "CORE_PEER_ADDRESS=qnet.qualify.com:7051" admin.qualify.com peer channel join -b qualify.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.language.com] is joining admin.language.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=admin.language.com:7051" admin.language.com peer channel join -b account.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls

echo "###[admin.language.com] is joining admin.language.com to language channel"
docker exec -e "CORE_PEER_ADDRESS=admin.language.com:7051" admin.language.com peer channel join -b language.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.language.com] is joining toeic.language.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=toeic.language.com:7051" admin.language.com peer channel join -b account.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls

echo "###[admin.language.com] is joining toeic.language.com to language channel"
docker exec -e "CORE_PEER_ADDRESS=toeic.language.com:7051" admin.language.com peer channel join -b language.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls


