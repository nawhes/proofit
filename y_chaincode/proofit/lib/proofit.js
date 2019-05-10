
'use strict';

const State = require('../ledger-api/state.js');

const channelName = "proofit";

class Proofit extends State {

    constructor(obj) {
        super(Proofit.getClass());
        Object.assign(this, obj);
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
    
}

module.exports = Proofit;
