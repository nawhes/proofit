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

    static createInstance(email, issueDate, digest) {
        return new Account({email, issueDate, digest});
    }
    
    static getClass() {
        return channelName;
    }

    static async getRecordKey(issuer, pin) {
        let key = hash.sha256().update(pin).update(issuer).digest('hex');
        let recordKey = issuer + "-" + key;
        return recordKey;
    }
}


module.exports = Account;
