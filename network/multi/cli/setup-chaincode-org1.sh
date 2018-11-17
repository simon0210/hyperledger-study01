#!/bin/bash

echo 'Install ChainCode'

CHAINCODE_DIR=github.com/hyperledger/fabric/examples/chaincode/go/src
CORE_PEER_ADDRESS=peer0.org1.fastcampus.com:7051 peer chaincode install -n marbles -v v4 -p $CHAINCODE_DIR/marbles

CHAINCODE_DIR=github.com/hyperledger/fabric/examples/chaincode/go/src
CORE_PEER_ADDRESS=peer1.org1.fastcampus.com:7051 peer chaincode install -n marbles -v v4 -p $CHAINCODE_DIR/marbles

echo 'Done'

echo 'Instantiate ChainCode'

CORE_PEER_ADDRESS=peer0.org1.fastcampus.com:7051 peer chaincode instantiate -o orderer0.fastcampus.com:7050 \
--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/fastcampus.com/orderers/orderer0.fastcampus.com/msp/tlscacerts/tlsca.fastcampus.com-cert.pem \
-C mychannel -n marbles -v v4 -c '{"Args":["init"]}' -P "OR   ('Org1MSP.peer','Org2MSP.peer')"

#CORE_PEER_ADDRESS=peer1.org1.fastcampus.com:7051 peer chaincode instantiate -o orderer0.fastcampus.com:7050 \
#--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/fastcampus.com/orderers/orderer0.fastcampus.com/msp/tlscacerts/tlsca.fastcampus.com-cert.pem \
#-C imchannel -n im -v 0.1 -c '{"Args":["init","a","200","b","200"]}' -P "OR   ('Org1MSP.peer','Org2MSP.peer')"

echo 'Done'
