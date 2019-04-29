
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

}

module.exports = Proofit;
