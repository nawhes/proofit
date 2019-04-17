echo "###[admin.app.com] instantiate account chaincode"
docker exec -e admin.app.com peer chaincode instantiate -n account -v beta0 -C account -c '{"Args":["account:instantiate"]}'

echo "###[admin.app.com] instantiate univ chaincode"
docker exec -e admin.app.com peer chaincode instantiate -n univ -v beta0 -C account -c '{"Args":["univ:instantiate"]}'

echo "###[admin.app.com] instantiate license chaincode"
docker exec -e admin.app.com peer chaincode instantiate -n license -v beta0 -C account -c '{"Args":["license:instantiate"]}'

echo "###[admin.app.com] instantiate language chaincode"
docker exec -e admin.app.com peer chaincode instantiate -n language -v beta0 -C account -c '{"Args":["language:instantiate"]}'
           
