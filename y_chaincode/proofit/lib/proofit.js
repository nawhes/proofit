
'use strict';

const State = require('../ledger-api/state.js');

const channelName = "proofit";

class Proofit extends State {

    constructor(email) {
        super(Proofit.getClass());
	    this.email = email;
    }

    static fromBuffer(buffer) {
        return State.deserialize(buffer);
    }

    static createInstance(email) {
        return new Proofit(email);
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
}

module.exports = Proofit;
