'use strict';

const fs = require('fs');
const { FileSystemWallet, X509WalletMixin } = require('fabric-network');
const path = require('path');

const Fixtures = path.resolve(__dirname, '../');

const wallet = new FileSystemWallet('./wallet');

async function main() {
	try {

        // Identity to credentials to be stored in the wallet
        const credPath = path.join(Fixtures, '/app/app.app.com/etc');
        const cert = fs.readFileSync(path.join(credPath, '/msp/signcerts/cert.pem')).toString();
        const key = fs.readFileSync(path.join(credPath, '/msp/keystore/dd5270f9fa162441375fd91a1e2781af0046d82730dbfc02f330fff47a1f7a5c_sk')).toString();

        // Load credentials into wallet
        const identityLabel = 'app.app.com';
        const identity = X509WalletMixin.createIdentity('app', cert, key);

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
