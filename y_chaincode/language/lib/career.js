
'use strict';

const State = require('../ledger-api/state.js');

const channelName = "language";

class Career extends State {

    constructor(career) {
        super(Career.getClass());
	    Object.assign(this, career);
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
