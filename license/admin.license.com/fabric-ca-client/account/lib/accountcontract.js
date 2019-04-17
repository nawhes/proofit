/*
SPDX-License-Identifier: Apache-2.0
*/

'use strict';

// Fabric smart contract classes
const { Contract, Context } = require('fabric-contract-api');
const ClientIdentity = require('fabric-shim').ClientIdentity;
const shim = require('fabric-shim');

// PaperNet specifc classes
const Account = require('./account.js');
const AccountList = require('./accountlist.js');

const channelName = "account";

/**
 * A custom context provides easy access to list of all commercial papers
 */
class AccountContext extends Context {

    constructor() {
        super();
        // All papers are held in a list of papers
        this.accountList = new AccountList(this);
    }

}

/**
 * Define commercial paper smart contract by extending Fabric Contract class
 *
 */
class AccountContract extends Contract {

    constructor() {
        // Unique namespace when multiple contracts per chaincode file
        super(channelName);
    }

    /**
     * Define a custom context for commercial paper
    */
    createContext() {
        return new AccountContext();
    }

    /**
     * Instantiate to perform any setup of the ledger that might be required.
     * @param {Context} ctx the transaction context
     */
    async instantiate(ctx) {
        // No implementation required with this example
        // It could be where data migration is performed, if necessary
        console.log('Instantiate the contract');
    }

    async create(ctx, email, pin, date) {

        // create an instance of the paper
        let account = await Account.createInstance(email, pin, date);

        // Add the paper to the list of all similar commercial papers in the ledger world state
        await ctx.accountList.addAccount(account);

        // Must return a serialized paper to caller of smart contract
        return shim.success(Buffer.from(account.toBuffer()).toString('ascii'));
        // return account.toBuffer();
    }

    async query(ctx, email){
        let account = await ctx.accountList.getAccount(email);

        return shim.success(Buffer.from(account.toBuffer()).toString('ascii'));
    }

    async queryKey(ctx, email, pin, channelName) {
        let queryKey = await Account.getRecordKey(ctx, email, pin, channelName);
        if (queryKey === false){
            return shim.console.error("validate failed");
        }
        return shim.success(Buffer.from(queryKey.toString()).toString('ascii'));
    }
}

module.exports = AccountContract;
