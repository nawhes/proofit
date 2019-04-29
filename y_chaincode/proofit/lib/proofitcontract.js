'use strict';

const { Contract, Context } = require('fabric-contract-api');
const shim = require('fabric-shim');
const ClientIdentity = require('fabric-shim').ClientIdentity;
const ChaincodeStub = require('fabric-shim').ChaincodeStub;

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

    async create(ctx, email, pin) {
        let proofit = await ctx.proofitList.getProofit(email);
        if (proofit == null) {
            let temp, response;
            let proofit = Proofit.createInstance(email);

            temp = await ctx.stub.invokeChaincode("account", new Array("query", email), "account");
            console.log("#################");
            console.log(typeof temp);
            console.log(temp.toString());
            if (typeof temp == "String") {
                if (temp.substring(0, 2) == "err") {
                    return shim.error("err: Hmm..");
                }
            }
            response = await Proofit.deserialize(temp);
            console.log("#################");
            console.log(typeof response);
            console.log(response.toString());

            Object.assign(proofit, response.payload);

            temp = await ctx.stub.invokeChaincode("account", new Array("query", email, pin, "univ"), "account");
            console.log("#################");
            console.log(typeof temp);
            console.log(temp.toString());
            if (typeof temp == "String") {
                if (temp.substring(0, 2) == "err") {
                    return shim.error("err: Hmm..");
                }
            }
            response = await Proofit.deserialize(temp);
            console.log("#################");
            console.log(typeof response);
            console.log(response.toString());

            proofit.univ = response.payload;

            temp = await ctx.stub.invokeChaincode("account", new Array("query", email, pin, "license"), "account");
            console.log("#################");
            console.log(typeof temp);
            console.log(temp.toString());
            if (typeof temp == "String") {
                if (temp.substring(0, 2) == "err") {
                    return shim.error("err: Hmm..");
                }
            }
            response = await Proofit.deserialize(temp);
            console.log("#################");
            console.log(typeof response);
            console.log(response.toString());

            proofit.license = response.payload;

            temp = await ctx.stub.invokeChaincode("account", new Array("query", email, pin, "language"), "account");
            console.log("#################");
            console.log(typeof temp);
            console.log(temp.toString());
            if (typeof temp == "String") {
                if (temp.substring(0, 2) == "err") {
                    return shim.error("err: Hmm..");
                }
            }
            response = await Proofit.deserialize(temp);
            console.log("#################");
            console.log(typeof response);
            console.log(response.toString());

            proofit.language = response.payload;

            await ctx.proofitList.addProofit(proofit);
            return shim.success(Proofit.serialize(proofit).toString('ascii'));
        }
        return shim.error("err: This account was previously created.");
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

        if (true){//validationPin
            ctx.proofitList.deleteProofit(proofit);
        } else {
            return shim.error("err: This pin is invalid.");
        }
    }
}

module.exports = ProofitContract;