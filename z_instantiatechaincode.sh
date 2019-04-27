echo "###[admin.app.com] instantiate account chaincode"
docker exec admin.app.com peer chaincode instantiate -n account -v beta0 -C account -c '{"Args":["account:instantiate"]}' -P "AND ('app.member')"

echo "###[admin.app.com] instantiate univ chaincode"
docker exec admin.app.com peer chaincode instantiate -n univ -v beta0 -C univ -c '{"Args":["univ:instantiate"]}' -P "AND ('univ.member')"

echo "###[admin.app.com] instantiate license chaincode"
#docker exec admin.app.com peer chaincode instantiate -n license -v beta0 -C license -c '{"Args":["license:instantiate"]}' -P "AND ('license.member')"

echo "###[admin.app.com] instantiate language chaincode"
#docker exec admin.app.com peer chaincode instantiate -n language -v beta0 -C language -c '{"Args":["language:instantiate"]}' -P "AND ('language.member')"
           
