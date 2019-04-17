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

// A wallet stores a collection of identities for use
//const wallet = new FileSystemWallet('../user/isabella/wallet');
const wallet = new FileSystemWallet('./wallet');

async function getRecordKey(gateway) {


    // Access PaperNet network
    console.log('Use network channel: account.');
    const network = await gateway.getNetwork('account');

    // Get addressability to commercial paper contract
    console.log('Use account smart contract.');
    const contract = await network.getContract('account', 'account');

    // issue commercial paper
    console.log('Submit queryKey transaction.');
    // const Response = await contract.evaluateTransaction('queryKey', 'nawhes@naver.com', '1079329', 'account');
    const Response = await contract.evaluateTransaction('queryKey', 'nawhes@naver.com', '1079329');

    // process response
    console.log('Process transaction response.');

    console.log(`queryKey : ${Response.payload}`);
    console.log('Transaction complete.');

    return Response.payload;

}

async function input(gateway, recordKey, career) {

    // Access PaperNet network
    console.log('Use network channel: univ.');
    const network = await gateway.getNetwork('univ');

    // Get addressability to commercial paper contract
    console.log('Use account smart contract.');
    const contract = await network.getContract('career', 'career');

    // issue commercial paper
    console.log('Submit input transaction.');

    const Response = await contract.submitTransaction('input', recordKey, JSON.stringify(career));

    // process response
    console.log('Process transaction response'+Response);

    console.log('Transaction complete.');

    return Response.payload;

}

// Main program function
async function main() {
      // Main try/catch block
  try {

  // A gateway defines the peers used to access Fabric networks
  const gateway = new Gateway();


    const credPath = path.join('/app/app.app.com/etc/msp');
    cert = fs.readFileSync(path.join(credPath, '/signcerts/cert.pem')).toString();
    key = fs.readFileSync(path.join(credPath, '/keystore/0b985589529eb0b2ae28dfcbd940e92c88963d48e2662fa8409b29d20a71eb41_sk')).toString();

    const identityLabel = 'app.app.com';
    const identity = {
        type:'X509',
        mspId: 'app',
        certificate = cert,
        privateKey = key,
    }
    await wallet.import(identityLabel, identity);

    // Specify userName for network access
    // const userName = 'isabella.issuer@magnetocorp.com';
    const userName = 'app.app.com';

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



    let recordKey = await getRecordKey(gateway);

    let career = {
        issueby = 'smu'
    }

    input(recordKey, career);
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