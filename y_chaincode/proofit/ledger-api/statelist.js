'use strict';

const State = require('./state.js');

class StateList {
    constructor(ctx, listName) {
        this.ctx = ctx;
        this.name = listName;
        this.supportedClasses = {};
    }

    async addState(key, state) {
        let ledgerKey = this.ctx.stub.createCompositeKey(this.name, [key]);
        let data = State.serialize(state);
        await this.ctx.stub.putState(ledgerKey, data);
    }

    async getState(key) {
        let ledgerKey = this.ctx.stub.createCompositeKey(this.name, [key]);
        let data = await this.ctx.stub.getState(ledgerKey);
        if (data == "" || data == null || typeof data == "undefined"){
            return null;
        }
        return State.deserialize(data);
    }

    async updateState(key, state) {
        let ledgerKey = this.ctx.stub.createCompositeKey(this.name, [key]);
        let data = State.serialize(state);
        await this.ctx.stub.putState(ledgerKey, data);
    }

    async deleteState(key) {
        let ledgerKey = this.ctx.stub.createCompositeKey(this.name, [key]);
        await this.ctx.stub.deleteState(ledgerKey);
    }

    use(stateClass) {
        this.supportedClasses[stateClass.getClass()] = stateClass;
    }

}

module.exports = StateList;
