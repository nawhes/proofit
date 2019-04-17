/*
SPDX-License-Identifier: Apache-2.0
*/

/*
 * This application has 6 basic steps:
 * 1. Select an identity from a wallet
 * 2. Connect to network gateway
 * 3. Access PaperNet network
 * 4. Construct request to issue commercial paper
 * 5. Submit transaction
 * 6. Process response
 */

'use strict';

// Bring key classes into scope, most importantly Fabric SDK network class
const fs = require('fs');
const yaml = require('js-yaml');
const { FileSystemWallet, Gateway } = require('fabric-network');
const path = require('path');

// A wallet stores a collection of identities for use
//const wallet = new FileSystemWallet('../user/isabella/wallet');
const wallet = new FileSystemWallet('./wallet');

async function getRecordKey(gateway) {


    // Access PaperNet network
    console.log('Use network channel: account.');
    var network = await gateway.getNetwork('account');

    // Get addressability to commercial paper contract
    console.log('Use account smart contract.');
    var contract = await network.getContract('account', 'account');

    // issue commercial paper
    console.log('Submit queryKey transaction.');
    // const Response = await contract.evaluateTransaction('queryKey', 'nawhes@naver.com', '1079329', 'account');
    var temp = await contract.evaluateTransaction('queryKey', 'nawhes@naver.com', '123','univ');

    let response = JSON.parse(temp);
    
    // process response
    console.log('Process transaction response.');

    console.log(response);
    console.log('Transaction complete.');

    return response.payload;
}

async function input(gateway, recordKey, career) {

    // Access PaperNet network
    console.log('Use network channel: univ.');
    var network = await gateway.getNetwork('univ');

    // Get addressability to commercial paper contract
    console.log('Use account smart contract.');
    var contract = await network.getContract('univ', 'univ');

    // issue commercial paper
    console.log('Submit input transaction.');

    let response = await contract.submitTransaction('input', recordKey, JSON.stringify(career));

    // process response
    console.log('Process transaction response'+Response);

    console.log('Transaction complete.');

    return response.payload;

}

// Main program function
async function main() {

  // A gateway defines the peers used to access Fabric networks
  const gateway = new Gateway();

  // Main try/catch block
  try {

    const credPath = path.join('./univ/smu.univ.com/etc/msp');
    let cert = fs.readFileSync(path.join(credPath, '/signcerts/cert.pem')).toString();
    let key = fs.readFileSync(path.join(credPath, '/keystore/d479b75848d9ef1a779ff85c480aeb3e48b2406b2f4fee87731e9df6033ab385_sk')).toString();

    const identityLabel = 'smu.univ.com';
    const identity = {
        type:'X509',
        mspId: 'univ',
        certificate: cert,
        privateKey: key,
    }
    await wallet.import(identityLabel, identity);

    // Specify userName for network access
    // const userName = 'isabella.issuer@magnetocorp.com';
    const userName = 'smu.univ.com';

    // Load connection profile; will be used to locate a gateway
    let connectionProfile = yaml.safeLoad(fs.readFileSync('./gateway/networkConnection.yaml', 'utf8'));

    // Set connection options; identity and wallet
    let connectionOptions = {
      identity: userName,
      wallet: wallet,
      discovery: { enabled:false, asLocalhost: true }
    };

    // Connect to gateway using application specified parameters
    console.log('Connect to Fabric gateway.');

    await gateway.connect(connectionProfile, connectionOptions);


    // Access PaperNet network
    console.log('Use network channel: account.');
    var network = await gateway.getNetwork('account');

    // Get addressability to commercial paper contract
    console.log('Use account smart contract.');
    var contract = await network.getContract('account', 'account');

    // issue commercial paper
    console.log('Submit queryKey transaction.');
    // const Response = await contract.evaluateTransaction('queryKey', 'nawhes@naver.com', '1079329', 'account');
    var temp = await contract.evaluateTransaction('queryKey', 'nawhes@naver.com', '123','univ');

    let response = JSON.parse(temp);
    
    // process response
    console.log('Process transaction response.');

    console.log(response);
    console.log('Transaction complete.');


    let career = {
        issueby: 'smu'
    }

    // Access PaperNet network
    console.log('Use network channel: univ.');
    var network2 = await gateway.getNetwork('univ');

    // Get addressability to commercial paper contract
    console.log('Use account smart contract.');
    var contract2 = await network2.getContract('univ', 'univ');

    // issue commercial paper
    console.log('Submit input transaction.');

    let response2 = await contract2.submitTransaction('input', response.payload, JSON.stringify(career));

    // process response
    console.log('Process transaction response'+Response);
    console.log(response2);

    console.log('Transaction complete.');

  } catch (error) {

    console.log(`Error processing transaction. ${error}`);
    console.log(error.stack);

  } finally {

    // Disconnect from the gateway
    console.log('Disconnect from Fabric gateway.')
    gateway.disconnect();

  }
}
main().then(() => {

  console.log('Issue program complete.');

}).catch((e) => {

  console.log('Issue program exception.');
  console.log(e);
  console.log(e.stack);
  process.exit(-1);

});
