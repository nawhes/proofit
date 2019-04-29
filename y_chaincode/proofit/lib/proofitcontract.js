'use strict';

const { Contract, Context } = require('fabric-contract-api');
const shim = require('fabric-shim');
const ClientIdentity = require('fabric-shim').ClientIdentity;

const Proofit = require('./proofit.js');
const ProofitList = require('./proofitlist.js/index.js');

const channelName = "proofit";

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

    async append(ctx, email, pin, channel) {
        let proofit = await ctx.proofitList.getProofit(email);
        let temp, response;
        if (proofit == null) {
            proofit = Proofit.createInstance(email);
            temp = await ctx.stub.invokeChaincode("account", new Array("query", email), "account");
            temp = temp.payload;
            response = temp.buffer.toString('ascii', temp.offset, temp.limit);
            console.log("#################");
            console.log(typeof response);
            console.log(response);
        
            response = JSON.parse(response);
            if (response.status == 500){
                return shim.error("InvokeChaincode was returned 500. >> "+response.payload);
            }
    
            Object.assign(proofit, response.payload);    
        }
        temp = await ctx.stub.invokeChaincode("account", new Array("queryKey", email, pin, channel),"account");
        temp = temp.payload;
        response = temp.buffer.toString('ascii', temp.offset, temp.limit);
        console.log("#################");
        console.log(typeof response);
        console.log(response);
    
        response = JSON.parse(response);
        if (response.status == 500){
            return shim.error("InvokeChaincode was returned 500. >> "+response.payload);
        }
        let recordKey = response.payload;

        temp = await ctx.stub.invokeChaincode(channel, new Array("queryByKey", recordKey), channel);
        temp = temp.payload;
        response = temp.buffer.toString('ascii', temp.offset, temp.limit);
        console.log("#################");
        console.log(typeof response);
        console.log(response);
    
        response = JSON.parse(response);
        if (response.status == 500){
            return shim.error("InvokeChaincode was returned 500. >> "+response.payload);
        }

        proofit[channel] = response.payload;

        await ctx.proofitList.addProofit(proofit);
        return shim.success(Proofit.serialize(proofit).toString('ascii'));
    }

    async read(ctx, email) {
        let proofit = await ctx.proofitList.getProofit(email);
        if (proofit == null){
            return shim.error("err: This proofit does not exist.");
        }
        return shim.success(Proofit.serialize(proofit).toString('ascii'));
    }

    async delete(ctx, email, pin){
        let proofit = await ctx.proofitList.getProofit(email);
        if (proofit == null){
            return shim.error("err: This proofit does not exist.");
        }

        if (Proofit.validationPin(proofit.digest, proofit.salt_validate, pin)){
            ctx.proofitList.deleteProofit(proofit);
        } else {
            return shim.error("err: This pin is invalid.");
        }
    }
}

module.exports = ProofitContract;
