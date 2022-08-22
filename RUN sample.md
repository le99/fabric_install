# Run asset-transfer-basic

```bash
cd /home/vagrant/hyperledger/fabric-samples/test-network

./network.sh up createChannel -ca -c mychannel -s couchdb -i 2.0.0
./network.sh deployCC -ccn basic -ccp ../asset-transfer-basic/chaincode-javascript/ -ccl javascript

```

```bash
# Second teminal
cd /home/vagrant/hyperledger/fabric-samples/asset-transfer-basic/application-javascript
rm -rf ./wallet/
node ./app.js
```

http://192.168.50.12:5984/_utils/#
user: admin
pw: adminpw

```bash
cd /home/vagrant/hyperledger/fabric-samples/test-network

#Stop network
./network down
```
## References
https://github.com/hyperledger/fabric-samples/tree/main/asset-transfer-basic