echo "###[admin.app.com] is joining admin.app.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7051" admin.app.com peer channel join -b account.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining admin.app.com to proofit channel"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7051" admin.app.com peer channel join -b proofit.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining admin.app.com to univ channel"
docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7051" admin.app.com peer channel join -b univ.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining admin.app.com to license channel"
#docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7051" admin.app.com peer channel join -b license.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining admin.app.com to language channel"
#docker exec -e "CORE_PEER_ADDRESS=admin.app.com:7051" admin.app.com peer channel join -b language.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls


echo "###[admin.recruit.com] is joining admin.recruit.com to proofit channel"
docker exec -e "CORE_PEER_ADDRESS=admin.recruit.com:7051" admin.recruit.com peer channel join -b proofit.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.recruit.com] is joining sk.recruit.com to proofit channel"
docker exec -e "CORE_PEER_ADDRESS=sk.recruit.com:7051" admin.recruit.com peer channel join -b proofit.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls


echo "###[admin.app.com] is joining app.app.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer channel join -b account.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining app.app.com to proofit channel"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer channel join -b proofit.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining app.app.com to univ channel"
docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer channel join -b univ.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining app.app.com to license channel"
#docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer channel join -b license.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls

echo "###[admin.app.com] is joining app.app.com to language channel"
#docker exec -e "CORE_PEER_ADDRESS=app.app.com:7051" admin.app.com peer channel join -b language.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls


echo "###[admin.univ.com] is joining admin.univ.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=admin.univ.com:7051" admin.univ.com peer channel join -b account.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls

echo "###[admin.univ.com] is joining admin.univ.com to proofit channel"
docker exec -e "CORE_PEER_ADDRESS=admin.univ.com:7051" admin.univ.com peer channel join -b proofit.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls

echo "###[admin.univ.com] is joining admin.univ.com to univ channel"
docker exec -e "CORE_PEER_ADDRESS=admin.univ.com:7051" admin.univ.com peer channel join -b univ.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tlsi

echo "###[admin.univ.com] is joining smu.univ.com to account channel"
docker exec -e "CORE_PEER_ADDRESS=smu.univ.com:7051" admin.univ.com peer channel join -b account.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls

echo "###[admin.univ.com] is joining smu.univ.com to proofit channel"
docker exec -e "CORE_PEER_ADDRESS=smu.univ.com:7051" admin.univ.com peer channel join -b proofit.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls

echo "###[admin.univ.com] is joining smu.univ.com to univ channel"
docker exec -e "CORE_PEER_ADDRESS=smu.univ.com:7051" admin.univ.com peer channel join -b univ.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls


echo "###[admin.license.com] is joining admin.license.com to account channel"
#docker exec -e "CORE_PEER_ADDRESS=admin.license.com:7051" admin.license.com peer channel join -b account.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.license.com] is joining admin.license.com to proofit channel"
#docker exec -e "CORE_PEER_ADDRESS=admin.license.com:7051" admin.license.com peer channel join -b proofit.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.license.com] is joining admin.license.com to license channel"
#docker exec -e "CORE_PEER_ADDRESS=admin.license.com:7051" admin.license.com peer channel join -b license.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.license.com] is joining qnet.license.com to account channel"
#docker exec -e "CORE_PEER_ADDRESS=qnet.license.com:7051" admin.license.com peer channel join -b account.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.license.com] is joining qnet.license.com to proofit channel"
#docker exec -e "CORE_PEER_ADDRESS=qnet.license.com:7051" admin.license.com peer channel join -b proofit.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.license.com] is joining qnet.license.com to license channel"
#docker exec -e "CORE_PEER_ADDRESS=qnet.license.com:7051" admin.license.com peer channel join -b license.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls


echo "###[admin.language.com] is joining admin.language.com to account channel"
#docker exec -e "CORE_PEER_ADDRESS=admin.language.com:7051" admin.language.com peer channel join -b account.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls

echo "###[admin.language.com] is joining admin.language.com to proofit channel"
#docker exec -e "CORE_PEER_ADDRESS=admin.language.com:7051" admin.language.com peer channel join -b proofit.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls

echo "###[admin.language.com] is joining admin.language.com to language channel"
#docker exec -e "CORE_PEER_ADDRESS=admin.language.com:7051" admin.language.com peer channel join -b language.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls

echo "###[admin.language.com] is joining toeic.language.com to account channel"
#docker exec -e "CORE_PEER_ADDRESS=toeic.language.com:7051" admin.language.com peer channel join -b account.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls

echo "###[admin.language.com] is joining toeic.language.com to proofit channel"
#docker exec -e "CORE_PEER_ADDRESS=toeic.language.com:7051" admin.language.com peer channel join -b proofit.block -o orderer.ca.com:7050  #--certfile PATH --cafile PATH --tls

echo "###[admin.language.com] is joining toeic.language.com to language channel"
#docker exec -e "CORE_PEER_ADDRESS=toeic.language.com:7051" admin.language.com peer channel join -b language.block -o orderer.ca.com:7050 #--certfile PATH --cafile PATH --tls
