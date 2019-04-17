
'use strict';

const State = require('../ledger-api/state.js');

const channelName = "license";

class Career extends State {

    constructor(recordKey) {
        super(Career.getClass());
	this.recordKey = recordKey;
    }

    static fromBuffer(buffer) {
        return Career.deserialize(Buffer.from(JSON.parse(buffer)));
    }

    toBuffer() {
        return Buffer.from(JSON.stringify(this));
    }

    static deserialize(data) {
        return State.deserializeClass(data, Career);
    }

    static createInstance(recordKey) {
        return new Career(recordKey);
    }

    static getClass() {
        return channelName;
    }

}

module.exports = Career;
