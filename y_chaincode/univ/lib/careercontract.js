'use strict';

const { Contract, Context } = require('fabric-contract-api');
const shim = require('fabric-shim');
const ClientIdentity = require('fabric-shim').ClientIdentity;
const ChaincodeStub = require('fabric-shim').ChaincodeStub;

const Career = require('./career.js');
const CareerList = require('./careerlist.js');

const channelName = "univ";

class CareerContext extends Context {
    constructor() {
        super();
        this.careerList = new CareerList(this);
    }
}

class CareerContract extends Contract {

    constructor() {
        // Unique namespace when multiple contracts per chaincode file
        super(channelName);
    }

    createContext() {
        //Define a custom context
        return new CareerContext();
    }

    /**
     * Instantiate to perform any setup of the ledger that might be required.
     * @param {Context} ctx the transaction context
     */
    async instantiate(ctx) {
        // It could be where data migration is performed, if necessary
        console.log('Instantiate the contract');
    }

    async input(ctx, email, pin, record) {
        let temp = await ctx.stub.invokeChaincode("account", new Array("queryKey", email, pin, "univ"), "account");

        console.log(temp.payload.buffer.data);

        let temp2 = JSON.stringify(temp.payload.buffer.data)
        console.log("#################");
        console.log(typeof temp2);
        console.log(temp2);

        let response = Buffer.from(temp2).toString('ascii');
        console.log("#################");
        console.log(typeof response);
        console.log(response);

        // let response2 = response.toString('ascii');
        // console.log("#################");
        // console.log(typeof response2);
        // console.log(response2);

        // let response3 = JSON.parse(response2)
        // console.log("#################");
        // console.log(typeof response3);
        // console.log(response3);

        let recordKey = response;

        let authority = new ClientIdentity(stub);
        let issuer = authority.getID();

        //preparation
        let postRecord = Career.deserialize(record);
        Object.assign(postRecord, {issueby: issuer});

        let career = await ctx.careerList.getCareer(recordKey);
        if (career == null) {
            career = Career.createInstance(recordKey);
            career[issuer] = [];
            career[issuer].push(postRecord);
            await ctx.careerList.addCareer(career);
        } else {
            if (career[issuer]) {
                career[issuer].push(postRecord);
            } else {
                career[issuer] = [];
                career[issuer].push(postRecord);
            }
            await ctx.careerList.updateCareer(career);  
        }
        return shim.success(Career.serialize(career).toString('ascii'));
    }

    async query(ctx, email, pin) {
        let temp = await ctx.stub.invokeChaincode("account", new Array("queryKey", email, pin, "univ"), "account");
        console.log("#################");
        console.log(typeof temp);
        console.log(temp.toString());
        if (typeof temp == "String"){
            if (temp.substring(0,2) == "err"){
                return shim.error("err: Hmm..");
            }
        }

        let response = JSON.parse(temp);
        // let response = Career.deserialize(temp);
        console.log("#################");
        console.log(typeof response);
        console.log(response.toString());
        
        let recordKey = response.payload;

        let career = await ctx.careerList.getCareer(recordKey);
        if (career == null){
            return shim.error("err: This career does not exist.");
        }
        return shim.success(Career.serialize(career).toString('ascii'));
    }

    async queryByIssuer(ctx, email, pin) {
        let temp = await ctx.stub.invokeChaincode("account", new Array("queryKey", email, pin, "univ"), "account");
        console.log("#################");
        console.log(typeof temp);
        console.log(temp.toString());
        if (typeof temp == "String"){
            if (temp.substring(0,2) == "err"){
                return shim.error("err: Hmm..");
            }
        }
        let response = Career.deserialize(temp);
        console.log("#################");
        console.log(typeof response);
        console.log(response.toString());
        
        let recordKey = response.payload;

        let authority = new ClientIdentity(stub);
        let issuer = authority.getID();

        let career = await ctx.careerList.getCareer(recordKey);
        if (career == null){
            return shim.error("err: This career does not exist.");
        }
        return shim.success(Career.serialize(career[issuer]).toString('ascii'));
    }

    async update(ctx, email, pin, record) {
        let temp = await ctx.stub.invokeChaincode("account", new Array("queryKey", email, pin, "univ"), "account");
        console.log("#################");
        console.log(typeof temp);
        console.log(temp.toString());
        if (typeof temp == "String"){
            if (temp.substring(0,2) == "err"){
                return shim.error("err: Hmm..");
            }
        }
        let response = Career.deserialize(temp);
        console.log("#################");
        console.log(typeof response);
        console.log(response.toString());
        
        let recordKey = response.payload;

        let authority = new ClientIdentity(stub);
        let issuer = authority.getID();

        let career = await ctx.careerList.getCareer(recordKey);
        if (career == null){
            return shim.error("err: This career does not exist.");
        }

        // preparation
        let postRecord = Career.deserialize(record);
        Object.assign(postRecord, {issueby: issuer});

        let index = career[issuer].findIndex(temp => temp.name === postRecord.name);
        if (index == -1){
            return shim.error("err: This record does not exist in this career.");
        }
        career[issuer][index] = postRecord;

        await ctx.careerList.updateCareer(career);
        return shim.success(Career.serialize(career).toString('ascii'));
    }

    async delete(ctx, email, pin){
        let temp = await ctx.stub.invokeChaincode("account", new Array("queryKey", email, pin, "univ"), "account");
        console.log("#################");
        console.log(typeof temp);
        console.log(temp.toString());
        if (typeof temp == "String"){
            if (temp.substring(0,2) == "err"){
                return shim.error("err: Hmm..");
            }
        }
        let response = Career.deserialize(temp);
        console.log("#################");
        console.log(typeof response);
        console.log(response.toString());
        
        let recordKey = response.payload;

        let career = await ctx.careerList.getCareer(recordKey);
        if (career == null){
            return shim.error("err: This career does not exist.");
        }
        ctx.careerList.deleteCareer(career);
    }

    async deleteByIssuer(ctx, email, pin) {
        let temp = await ctx.stub.invokeChaincode("account", new Array("queryKey", email, pin, "univ"), "account");
        console.log("#################");
        console.log(typeof temp);
        console.log(temp.toString());
        if (typeof temp == "String"){
            if (temp.substring(0,2) == "err"){
                return shim.error("err: Hmm..");
            }
        }
        let response = Career.deserialize(temp);
        console.log("#################");
        console.log(typeof response);
        console.log(response.toString());
        
        let recordKey = response.payload;

        let authority = new ClientIdentity(stub);
        let issuer = authority.getID();

        let career = await ctx.careerList.getCareer(recordKey);
        if (career == null){
            return shim.error("err: This career does not exist.");
        }
        delete career[issuer];
    }
}

module.exports = CareerContract;
