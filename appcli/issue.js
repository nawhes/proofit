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

'use strict'

const fs = require('fs');
const yaml = require('js-yaml');
const { FileSystemWallet, Gateway } = require('fabric-network');

const wallet = new FileSystemWallet('./wallet');

async function main() {

  const gateway = new Gateway();

  try {
    const userName = 'app.app.com';


    // Load connection profile; will be used to locate a gateway
    let connectionProfile = yaml.safeLoad(fs.readFileSync('./gateway/networkConnection.yaml', 'utf8'));

    // Set connection options; identity and wallet
    let connectionOptions = {
      identity: userName,
      wallet: wallet,
      clientTlsIdentity: userName,
      discovery: { enabled: true, asLocalhost: true },
      eventHandlerOptions: {
	  commitTimeout: 100
      }
    };

    // Connect to gateway using application specified parameters
    console.log('Connect to Fabric gateway.');

    await gateway.connect(connectionProfile, connectionOptions);

    // Access PaperNet network
    console.log('Use network channel: mychannel.');

    const network = await gateway.getNetwork('account');

    // Get addressability to commercial paper contract
    console.log('Use org.papernet.commercialpaper smart contract.');

    const contract = await network.getContract('account');

    // issue commercial paper
    console.log('Submit commercial paper issue transaction.');

    const response = await contract.submitTransaction('create', 'nawhes@ggmail.com', '$2b$04$/2sHvpKlKNXddsRHfCMWye9baYD06/jSccqGG2Fgdrx3NDNn0W.iu');

    // process response
    console.log('Process issue transaction response.');

    let paper = JSON.parse(response.toString());

    console.log(`${paper.issuer} commercial paper : ${paper.paperNumber} successfully issued for value ${paper.faceValue}`);
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
