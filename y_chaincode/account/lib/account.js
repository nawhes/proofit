/*
SPDX-License-Identifier: Apache-2.0
*/

'use strict';

// Utility class for ledger state
const State = require('../ledger-api/state.js');
const crypto = require('crypto');

const channelName = "account";

class Account extends State {

    constructor(obj) {
        super(Account.getClass());
        obj.txid = [];
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

    static async getRecordKey(email, issuer) {
        let recordKey = crypto.pbkdf2Sync(email, issuer, 4, 32, 'sha256');
        return recordKey.toString('hex');
    }
}


module.exports = Account;
