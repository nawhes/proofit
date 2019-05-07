'use strict';

const State = require('./state.js');

class StateList {
    constructor(ctx, listName) {
        this.ctx = ctx;
        this.name = listName;
        this.supportedClasses = {};
    }

    async addState(state) {
        let key = this.ctx.stub.createCompositeKey(this.name, state.recordKey);
        let data = State.serialize(state);
        await this.ctx.stub.putState(key, data);
    }

    async getState(key) {
        let ledgerKey = this.ctx.stub.createCompositeKey(this.name, key);
        let data = await this.ctx.stub.getState(ledgerKey);
        if (data == "" || data == null || typeof data == "undefined"){
            return null;
        }
        return State.deserialize(data);
    }

    async updateState(state) {
        let key = this.ctx.stub.createCompositeKey(this.name, state.recordKey);
        let data = State.serialize(state);
        await this.ctx.stub.putState(key, data);
    }

    async deleteState(state) {
        let key = this.ctx.stub.createCompositeKey(this.name, state.recordKey);
        await this.ctx.stub.deleteState(key);
    }

    use(stateClass) {
        this.supportedClasses[stateClass.getClass()] = stateClass;
    }

}

module.exports = StateList;
