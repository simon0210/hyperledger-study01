# FastCample HLF 1기 

## Hyperledger Network Basic 개발 환경 구성
marbles/config/connection_profile.local.json 에서 인증서 관련 경로 설정이 하기와 같이 되어 있다.

```
	"organizations": {
		"Org1MSP": {
			"mspid": "Org1MSP",
			"peers": [
				"fabric-peer-org1"
			],
			"certificateAuthorities": [
				"fabric-ca"
			],
			"x-adminCert": {
				"path": "/$HOME/github/hyperledger-study01/network/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/admincerts/Admin@org1.example.com-cert.pem"
			},
			"x-adminKeyStore": {
				"path": "/$HOME/github/hyperledger-study01/network/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/"
			}
		}
	}
```

그러므도 git clone을 받을때 홈디렉토리에서 github 디렉토리를 만들고 clone 받기를 권장한다.
(단, 별도 디렉토리에 받을 경우 marbles/config/connection_profile.local.json 에서 인증서 경로 설정을 바꾸어주어야 한다.)

```
$)cd ~ #홈디렉토리로 이동
$)mkdir github
$)git clone https://github.com/simon0210/hyperledger-study01.git
```

클론받은 디렉토리로 이동후 npm install 명령으로 marbles 필요 팩키지를 설치한다. 필요 팩키지는 package.json 에 기술되어 있다.

```
cd hyperledger-study01/marbles
npm install
```
marbles 예제를 돌리기 위한 모듈을 설치 하였다면 Hyperledger Fabric Network 를 기동 한다.

```
$)cd ~/github/hyperledger-study01/network
$)./start.sh
```
HLF 도커 컨테이너가 정상적으로 올라왔는지 확인한다.

```
$)docker ps -a

CONTAINER ID        IMAGE                        COMMAND                  CREATED             STATUS              PORTS                                            NAMES
e1a08c77b210        hyperledger/fabric-peer      "peer node start"        16 seconds ago      Up 15 seconds       0.0.0.0:7051->7051/tcp, 0.0.0.0:7053->7053/tcp   peer0.org1.example.com
39c3a88ea19d        hyperledger/fabric-orderer   "orderer"                19 seconds ago      Up 15 seconds       0.0.0.0:7050->7050/tcp                           orderer.example.com
23394ca430ff        hyperledger/fabric-ca        "sh -c 'fabric-ca-se…"   19 seconds ago      Up 17 seconds       0.0.0.0:7054->7054/tcp                           ca.example.com
e3082169e0cc        hyperledger/fabric-couchdb   "tini -- /docker-ent…"   19 seconds ago      Up 17 seconds       4369/tcp, 9100/tcp, 0.0.0.0:5984->5984/tcp       couchdb

```
