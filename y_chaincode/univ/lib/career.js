
'use strict';

const State = require('../ledger-api/state.js');

const channelName = "univ";

class Career extends State {

    constructor(obj) {
        super(Career.getClass());
        obj.txid = [];
	    Object.assign(this, obj);
    }

    static fromBuffer(buffer) {
        return State.deserialize(buffer);
    }

    static createInstance(career) {
        return new Career(career);
    }

    static getClass() {
        return channelName;
    }

}

module.exports = Career;
