'use strict';

const { Contract, Context } = require('fabric-contract-api');
const shim = require('fabric-shim');

const bcrypt = require('bcrypt');
const Proofit = require('./proofit.js');
const ProofitList = require('./proofitlist.js');

const channelName = "proofitUniv";

class ProofitContext extends Context {
    constructor() {
        super();
        this.proofitList = new ProofitList(this);
    }
}

class ProofitContract extends Contract {

    constructor() {
        // Unique namespace when multiple contracts per chaincode file
        super(channelName);
    }

    createContext() {
        //Define a custom context
        return new ProofitContext();
    }

    /**
     * Instantiate to perform any setup of the ledger that might be required.
     * @param {Context} ctx the transaction context
     */
    async instantiate(ctx) {
        // It could be where data migration is performed, if necessary
        console.log('Instantiate the contract');
    }

    async append(ctx, email, pin, channel, issuer) {
        let proofit = await ctx.proofitList.getProofit(email);
        if (proofit == null) {
            let temp = await ctx.stub.invokeChaincode("account", new Array("query", email, pin), "account");
            temp = temp.payload;
            let response = temp.buffer.toString('ascii', temp.offset, temp.limit);

            response = JSON.parse(response);
            if (response.status == 500) {
                return shim.error("InvokeChaincode was returned 500. >> " + response.message);
            }
            temp = Proofit.deserialize(response.payload);

            proofit = Proofit.createInstance(email, temp.digest);
        }
        let temp = await ctx.stub.invokeChaincode("account", new Array("queryKey", email, pin, issuer), "account");
        temp = temp.payload;
        let response = temp.buffer.toString('ascii', temp.offset, temp.limit);

        response = JSON.parse(response);
        if (response.status == 500) {
            return shim.error("InvokeChaincode was returned 500. >> " + response.message);
        }
        let recordKey = await response.payload;
        temp = await ctx.stub.invokeChaincode(channel, new Array("queryByKey", recordKey), channel);
        temp = temp.payload;
        response = temp.buffer.toString('ascii', temp.offset, temp.limit);

        response = JSON.parse(response);
        if (response.status == 500) {
            return shim.error("InvokeChaincode was returned 500. >> " + response.message);
        }

        let record = Proofit.deserialize(response.payload);

        if (!proofit[channel]) {
            proofit[channel] = [];
        }
        if (!proofit[channel][issuer]) {
            proofit[channel][issuer] = [];
        }
        await proofit[channel][issuer].push(record);

        await ctx.proofitList.addProofit(proofit);
        return shim.success(Proofit.serialize(proofit).toString('ascii'));
    }

    async read(ctx, email) {
        let proofit = await ctx.proofitList.getProofit(email);
        if (proofit == null) {
            return shim.error("err: This proofit does not exist.");
        }
        return shim.success(Proofit.serialize(proofit).toString('ascii'));
    }

    async delete(ctx, email, pin) {
        let proofit = await ctx.proofitList.getProofit(email);
        if (proofit == null) {
            return shim.error("err: This proofit does not exist.");
        } else if (bcrypt.compareSync(pin, account.digest)) {
            ctx.proofitList.deleteProofit(proofit);
            return shim.success("deleted.");
        } else {
            return shim.error("err: This pin is invalid.");
        }
    }
}

module.exports = ProofitContract;
