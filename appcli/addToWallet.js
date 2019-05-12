'use strict';

const fs = require('fs');
const { FileSystemWallet, X509WalletMixin } = require('fabric-network');
const path = require('path');

const Fixtures = path.resolve(__dirname, '../');

const wallet = new FileSystemWallet('./wallet');

async function main() {
	try {

        // Identity to credentials to be stored in the wallet
        const credPath = path.join(Fixtures, '/recruit/sk.recruit.com/etc');
        const cert = fs.readFileSync(path.join(credPath, '/msp/signcerts/cert.pem')).toString();
        const key = fs.readFileSync(path.join(credPath, '/msp/keystore/e99a1b6f3ad53f246b474b2736d507cc3f4eaf7b8a46069c49903d90f92b9359_sk')).toString();

        // Load credentials into wallet
        const identityLabel = 'sk.recruit.com';
        const identity = X509WalletMixin.createIdentity('recruit', cert, key);

        await wallet.import(identityLabel, identity);

    } catch (error) {
        console.log(`Error adding to wallet. ${error}`);
        console.log(error.stack);
    }
}

main().then(() => {
    console.log('done');
}).catch((e) => {
    console.log(e);
    console.log(e.stack);
    process.exit(-1);
});
