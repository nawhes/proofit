'use strict';

const { Contract, Context } = require('fabric-contract-api');
const shim = require('fabric-shim');
const crypto = require('crypto');
const bcrypt = require('bcrypt');

const Proofit = require('./proofit.js');
const ProofitList = require('./proofitlist.js');

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

    async create(ctx, email, id, digest) {
        if (arguments.length != 4) {
            return shim.error("Four three parameters are required.");
        }
        let key = crypto.pbkdf2Sync(email, id, 4, 32, 'sha256');
        key = key.toString('hex');
        let proofit = await ctx.proofitList.getProofit(key);
        if (proofit == null) {
            proofit = await Proofit.createInstance(digest);
            await ctx.proofitList.addProofit(key, proofit);
            return shim.success(Proofit.serialize(proofit).toString('ascii'));
        }
        return shim.error("err: This proofit was previously created.");
    }


    async append(ctx, email, id, pin, channel, issuer) {
        if (arguments.length != 6) {
            return shim.error("Six parameters are required.");
        }
        let key = crypto.pbkdf2Sync(email, id, 4, 32, 'sha256');
        key = key.toString('hex');
        let proofit = await ctx.proofitList.getProofit(key);
        if (proofit == null) {
            return shim.error("err: This proofit does not exist.");
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

        if (!proofit[issuer]) {
            proofit[issuer] = [];
        }
        await proofit[issuer].push(record);

        await ctx.proofitList.addProofit(key, proofit);
        return shim.success(Proofit.serialize(proofit).toString('ascii'));

    }

    async appendEmail(ctx, email, id) {
        if (arguments.length != 3) {
            return shim.error("Three parameters are required.");
        }
        let key = crypto.pbkdf2Sync(email, id, 4, 32, 'sha256');
        key = key.toString('hex');
        let proofit = await ctx.proofitList.getProofit(key);
        proofit.email = email;
        await ctx.proofitList.addProofit(key, proofit);
        return shim.success(Proofit.serialize(proofit).toString('ascii'));
    }

    async read(ctx, email, id) {
        if (arguments.length != 3) {
            return shim.error("Three parameters are required.");
        }
        let key = crypto.pbkdf2Sync(email, id, 4, 32, 'sha256');
        key = key.toString('hex');
        let proofit = await ctx.proofitList.getProofit(key);
        if (proofit == null) {
            return shim.error("err: This proofit does not exist.");
        }
        return shim.success(Proofit.serialize(proofit).toString('ascii'));

    }

    async delete(ctx, email, id, pwd) {
        if (arguments.length != 4) {
            return shim.error("At least three parameters are required.");
        }
        let key = crypto.pbkdf2Sync(email, id, 4, 32, 'sha256');
        key = key.toString('hex');
        let proofit = await ctx.proofitList.getProofit(key);
        if (proofit == null) {
            return shim.error("err: This proofit does not exist.");
        } else if (true) {
        // } else if (bcrypt.compareSync(pwd, proofit.digest)) {
            ctx.proofitList.deleteProofit(key);
            return shim.success("deleted.");
        } else {
            return shim.error("err: This pin is invalid.");
        }

    }
}

module.exports = ProofitContract;
