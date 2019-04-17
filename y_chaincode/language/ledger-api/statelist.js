'use strict';

const State = require('./state.js');
const prefix = "-";

class StateList {

    constructor(ctx, listName) {
        this.ctx = ctx;
        this.name = listName;
        this.supportedClasses = {};

    }

    async addState(state) {
        let key = this.ctx.stub.createCompositeKey(this.name, [prefix, state.recordKey]);
        let data = State.serialize(state);
        await this.ctx.stub.putState(key, data);
    }

    async getState(key) {
        let ledgerKey = this.ctx.stub.createCompositeKey(this.name, [prefix, key]);
        let data = await this.ctx.stub.getState(ledgerKey);
        if( data == "" || data == null || data == undefined || ( data != null && typeof data == "object" && !Object.keys(data).length ) ) {
        //data == null
            return false;
        } else { //data != null
            return JSON.parse(data.toString());
        }
        // let state = State.deserialize(data, this.supportedClasses);
    }

    async updateState(state) {
        let key = this.ctx.stub.createCompositeKey(this.name, [prefix, state.recordKey]);
        let data = State.serialize(state);
        await this.ctx.stub.putState(key, data);
    }

    use(stateClass) {
        this.supportedClasses[stateClass.getClass()] = stateClass;
    }

}

module.exports = StateList;
