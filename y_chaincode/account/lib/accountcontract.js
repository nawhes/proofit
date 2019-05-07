/*
SPDX-License-Identifier: Apache-2.0
*/

'use strict';

const { Contract, Context } = require('fabric-contract-api');
const shim = require('fabric-shim');
const ClientIdentity = require('fabric-shim').ClientIdentity;

const Account = require('./account.js');
const AccountList = require('./accountlist.js');

const channelName = "account";


class AccountContext extends Context {
    constructor() {
        super();
        this.accountList = new AccountList(this);
    }
}

class AccountContract extends Contract {

    constructor() {
        // Unique namespace when multiple contracts per chaincode file
        super(channelName);
    }

    createContext() {
        //Define a custom context
        return new AccountContext();
    }

    /**
     * Instantiate to perform any setup of the ledger that might be required.
     * @param {Context} ctx the transaction context
     */
    async instantiate(ctx) {
        // It could be where data migration is performed, if necessary
        console.log('Instantiate the contract');
    }

    /**
     * 계정생성 > return 계정정보
     */
    async create(ctx, email, pin) {
        let account = await ctx.accountList.getAccount(email);
        if (arguments.length != 2){
            return shim.error("err: Two parameters are required.");
        }
        if (account == null){
            account = await Account.createInstance(email, pin, Date());
            await ctx.accountList.addAccount(account);
            return shim.success(Account.serialize(account).toString('ascii'));
        }
        return shim.error("err: This account was previously created.");
    }

    /**
     * (email, pin) > return 계정정보
     * (email, pin, channel) > return 이력정보
     */
    async query(ctx, email, pin, channel){
        if (arguments.length < 2){
            return shim.error("At least two parameters are required.");
        }
        let account = await ctx.accountList.getAccount(email);
        if (account == null){
            return shim.error("err: This account does not exist.");
        }
        if (arguments.length == 2){
            return shim.success(Account.serialize(account).toString('ascii'));
        } else if (Account.validationPin(account.digest, account.salt, pin)){
            let recordKey = Account.getRecordKey(issuer, pin);
            let temp = await ctx.stub.invokeChaincode(channel, new Array("queryByKey", recordKey), channel);
            temp = temp.payload;
            let response = temp.buffer.toString('ascii', temp.offset, temp.limit);
            console.log("#################");
            console.log(typeof response);
            console.log(response);
        
            response = JSON.parse(response);
            if (response.status == 500){
                return shim.error("InvokeChaincode was returned 500. >> "+response.payload);
            }

            return shim.success(Account.serialize(response.payload).toString('ascii'));
        }
        return shim.error("err: This pin is invalid.");
    }

    /**
     * 각 채널에서 이력입력을 위해 사용하는 함수
     */
    async queryKey(ctx, email, pin, issuer) {
        if (arguments.length != 4){
            return shim.error("err: Three parameters are required.");
        }
        let account = await ctx.accountList.getAccount(email);
        if (account == null){
            return shim.error("err: This account does not exist.");
        }
        let recordKey;
        if (Account.validationPin(account.digest, account.salt, pin)){
            recordKey = await Account.getRecordKey(issuer, pin);
            return shim.success(Buffer.from(recordKey.toString()).toString('ascii'));
        }
        return shim.error("err: This pin is invalid");
    }

    async update(ctx, email, pin, channel, issuer){
        let account = await ctx.accountList.getAccount(email);
        if (account == null){
            return shim.error("err: This account does not exist.");
        } else if (Account.validationPin(account.digest, account.salt, pin)){
            if (!account[channel]){
                account[channel] = [];
            }
            account[channel].push(issuer);
            await ctx.accountList.addAccount(account);
            return shim.success(Account.serialize(account).toString('ascii'));
        }
        return 
    }

    async delete(ctx, email, pin, issuer) {//미완성
        let account = await ctx.accountList.getAccount(email);
        if (account == null){
            return shim.error("err: This account does not exist.");
        }
        let recordKey;
        if (Account.validationPin(account.digest, account.salt, pin)){
            recordKey = await Account.getRecordKey(issuer, pin);
        } else {
            return shim.error("err: This pin is invalid.");
        }
        //request to delete career
        ctx.accountList.deleteAccount(account);
    }
}

module.exports = AccountContract;