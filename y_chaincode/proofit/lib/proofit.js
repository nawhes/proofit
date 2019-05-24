
'use strict';

const State = require('../ledger-api/state.js');

const channelName = "proofit";

class Proofit extends State {

    constructor(digest) {
        super(Proofit.getClass());
        this.txid = [];
        this.digest = digest
    }

    static fromBuffer(buffer) {
        return State.deserialize(buffer);
    }

    static createInstance(digest) {
        return new Proofit(digest);
    }

    static getClass() {
        return channelName;
    }
    
}

module.exports = Proofit;
