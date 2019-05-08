
'use strict';

const State = require('../ledger-api/state.js');

const channelName = "proofit";

class Proofit extends State {

    constructor(obj) {
        super(Proofit.getClass());
	Object.assign(this,obj);
    }

    static fromBuffer(buffer) {
        return State.deserialize(buffer);
    }

    static createInstance(email, digest) {
        return new Proofit({email, digest});
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
}

module.exports = Proofit;
