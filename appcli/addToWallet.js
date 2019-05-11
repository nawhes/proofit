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
        const key = fs.readFileSync(path.join(credPath, '/msp/keystore/f700b39a38526c0940588e3a8b4dcbde12d73b470e4f5f80bb845679d9cbc56c_sk')).toString();

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
