
'use strict';

const State = require('../ledger-api/state.js');

const channelName = "univ";

class Career extends State {

    constructor(recordKey) {
        super(Career.getClass());
	    this.recordKey = recordKey;
    }

    static fromBuffer(buffer) {
        return State.deserialize(buffer);
    }

    static createInstance(recordKey) {
        return new Career(recordKey);
    }

    static getClass() {
        return channelName;
    }

}

module.exports = Career;
