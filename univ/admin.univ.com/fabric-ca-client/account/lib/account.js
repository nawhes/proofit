/*
SPDX-License-Identifier: Apache-2.0
*/

'use strict';

// Utility class for ledger state
const State = require('../ledger-api/state.js');

const rand = require('csprng');
const hash = require('hash.js');

const channelName = "account";

/**
 * CommercialPaper class extends State class
 * Class will be used by application and smart contract to define a paper
 */
class Account extends State {

    constructor(obj) {
        super(Account.getClass());
        Object.assign(this, obj);
    }

    /**
     * Basic getters and setters
    */
    getEmail() {
        return this.email;
    }

    getDigest() {
        return this.digest;
    }

    getSalt() {
        return this.salt;
    }

    static fromBuffer(buffer) {
        return Account.deserialize(Buffer.from(JSON.parse(buffer)));
    }

    toBuffer() {
        return Buffer.from(JSON.stringify(this));
    }

    /**
     * Deserialize a state data to commercial paper
     * @param {Buffer} data to form back into the object
     */
    static deserialize(data) {
        return State.deserializeClass(data, Account);
    }

    /**
     * Factory method to create a commercial paper object
     */
    static createInstance(email, pin, issueDate) {
        let salt_validate = rand(256, 16);
        let salt_record = rand(256, 16);
        let temp = hash.sha256().update(pin).digest('hex');
        let digest = hash.sha256().update(temp).update(salt_validate).digest('hex');
        return new Account({ email, digest, salt_validate, salt_record, issueDate });
    }

    /**
     * @param {*context} ctx 
     * @param {*string} email 
     * @param {*string} pin 
     * 같으면 return account, 다르면 return false
     */
    static async validationPin(ctx, email, pin) {
        let account = await ctx.accountList.getAccount(email);
        let temp = hash.sha256().update(pin).digest('hex');
        let digest = await hash.sha256().update(temp).update(account.salt_validate).digest('hex');
        if (account.digest === digest) {
            return account;
        }
        else {
            return false;
        }
    }

    /**
     * @param {*context} ctx
     * @param {*string} email
     * @param {*string} pin 
     * 같으면 return true, 다르면 return false
     */
    static async getRecordKey(ctx, email, pin, channelName) {
        let account = await Account.validationPin(ctx, email, pin);
        if(account === false){
            console.log("validate failed");
            return false;
        }
        else {
            console.log("validate success");
            let temp = hash.sha256().update(pin).digest('hex');

            let RecordKey = await hash.sha256().update(temp).update(account.salt_record).update(channelName).digest('hex');

            return RecordKey;
        }
    }

    static getClass() {
        return channelName;
    }


}

module.exports = Account;
