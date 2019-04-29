/*
SPDX-License-Identifier: Apache-2.0
*/

'use strict';

// Utility class for ledger state
const State = require('../ledger-api/state.js');

const rand = require('csprng');
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

    static createInstance(email, pin, issueDate) {
        let salt_validate = rand(256, 16);
        let salt_record = rand(256, 16);
        let temp = hash.sha256().update(pin).digest('hex');
        let digest = hash.sha256().update(temp).update(salt_validate).digest('hex');
        return new Account({email, digest, salt_validate, salt_record, issueDate});
    }
    
    static getClass() {
        return channelName;
    }

    static async validationPin(preDigest, salt_validate, postPin) {
        let temp = hash.sha256().update(postPin).digest('hex');
        let postDigest = await hash.sha256().update(temp).update(salt_validate).digest('hex');
        if (preDigest === postDigest) {
            return true;
        }
        else {
            return false;
        }
    }

    static async getRecordKey(salt_record, channel, pin) {
        let temp = hash.sha256().update(pin).digest('hex');
        let RecordKey = await hash.sha256().update(temp).update(salt_record).update(channel).digest('hex');
        return RecordKey;
    }
}

module.exports = Account;
