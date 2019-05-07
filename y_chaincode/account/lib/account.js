/*
SPDX-License-Identifier: Apache-2.0
*/

'use strict';

// Utility class for ledger state
const State = require('../ledger-api/state.js');

const hash = require('hash.js');

const channelName = "account";

class Account extends State {

    constructor(obj) {
        super(Account.getClass());
        Object.assign(this, obj);
    }

    static fromBuffer(buffer) {
        return State.deserialize(buffer);
    }

    static createInstance(email, pin, issueDate, salt) {
        let temp = hash.sha256().update(pin).digest('hex');
        let digest = hash.sha256().update(temp).update(salt).digest('hex');
        return new Account({email, digest, salt, issueDate});
    }
    
    static getClass() {
        return channelName;
    }

    static async validationPin(preDigest, salt, postPin) {
        let temp = hash.sha256().update(postPin).digest('hex');
        let postDigest = await hash.sha256().update(temp).update(salt).digest('hex');
        if (preDigest === postDigest) {
            return true;
        }
        else {
            return false;
        }
    }

    static async getRecordKey(issuer, pin) {
        let temp = hash.sha256().update(pin).digest('hex');
        let key = await hash.sha256().update(temp).update(issuer).digest('hex');
        let recordKey = issuer + "-" + key;
        return recordKey;
    }
}

module.exports = Account;
