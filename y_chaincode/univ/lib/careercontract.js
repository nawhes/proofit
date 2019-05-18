'use strict';

const { Contract, Context } = require('fabric-contract-api');
const shim = require('fabric-shim');

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

    async input(ctx, email, pin, issuer, record) {
        if (arguments.length != 5){
            return shim.error("err: Five parameters are required.");
        }
        let temp = await ctx.stub.invokeChaincode("account", new Array("queryKey", email, pin, issuer), "account");
        temp = temp.payload;
        let response = temp.buffer.toString('ascii', temp.offset, temp.limit);
    
        response = JSON.parse(response);
        if (response.status == 500){
            return shim.error("InvokeChaincode was returned 500. >> "+response.message);
        }
        let recordKey = response.payload;

        //preparation
        let postRecord = Career.deserialize(record);

        let career = await ctx.careerList.getCareer(recordKey);
        if (!career) {
            career = Career.createInstance(postRecord);
            await ctx.careerList.addCareer(recordKey, career);
        } else {
            Object.assign(career, postRecord);
            await ctx.careerList.updateCareer(recordKey, career);  
        }
        return shim.success(Career.serialize(career).toString('ascii'));
    }

 
    async query(ctx, email, pin, issuer) {
        if (arguments.length != 4){
            return shim.error("err: Four parameters are required.");
        }
        let temp = await ctx.stub.invokeChaincode("account", new Array("queryKey", email, pin, issuer), "account");
        temp = temp.payload;
        let response = temp.buffer.toString('ascii', temp.offset, temp.limit);
    
        response = JSON.parse(response);
        if (response.status == 500){
            return shim.error("InvokeChaincode was returned 500. >> "+response.message);
        }
        
        let recordKey = response.payload;

        let career = await ctx.careerList.getCareer(recordKey);
        if (career == null){
            return shim.error("err: This career does not exist.");
        }
        return shim.success(Career.serialize(career).toString('ascii'));
    }
    

    async queryByKey(ctx, recordKey) {
        if (arguments.length != 2){
            return shim.error("err: Two parameters are required.");
        }
        let career = await ctx.careerList.getCareer(recordKey);
        if (!career){
            return shim.error("err: This career does not exist.");
        }
        return shim.success(Career.serialize(career).toString('ascii'));
    }

    /*
    async queryByIssuer(ctx, email, pin) {
        if (arguments.length != 2){
            return shim.error("err: Two parameters are required.");
        }
        let temp = await ctx.stub.invokeChaincode("account", new Array("queryKey", email, pin, "univ"), "account");
        temp = temp.payload;
        let response = temp.buffer.toString('ascii', temp.offset, temp.limit);
        console.log("#################");
        console.log(typeof response);
        console.log(response);
    
        response = JSON.parse(response);
        if (response.status == 500){
            return shim.error("InvokeChaincode was returned 500. >> "+response.payload);
        }

        let recordKey = response.payload;

        let authority = new ClientIdentity(ctx.stub);
        let issuer = authority.getID();

        let career = await ctx.careerList.getCareer(recordKey);
        if (career == null){
            return shim.error("err: This career does not exist.");
        }
        return shim.success(Career.serialize(career[issuer]).toString('ascii'));
    }
    

    async update(ctx, email, pin, record, recordId) {
        if (arguments.length != 4){
            return shim.error("err: Four parameters are required.");
        }
        let temp = await ctx.stub.invokeChaincode("account", new Array("queryKey", email, pin, "univ"), "account");
        temp = temp.payload;
        let response = temp.buffer.toString('ascii', temp.offset, temp.limit);
        console.log("#################");
        console.log(typeof response);
        console.log(response);
    
        response = JSON.parse(response);
        if (response.status == 500){
            return shim.error("InvokeChaincode was returned 500. >> "+response.payload);
        }
        
        let recordKey = response.payload;

        let authority = new ClientIdentity(ctx.stub);
        let issuer = authority.getID();

        let career = await ctx.careerList.getCareer(recordKey);
        if (career == null){
            return shim.error("err: This career does not exist.");
        }

        // preparation
        let postRecord = Career.deserialize(record);
        Object.assign(postRecord, {issueby: issuer});

        let index = career[issuer].findIndex(temp => temp[recordId] === postRecord[recordId]);
        if (index == -1){
            return shim.error("err: This recordId does not exist in this career.");
        }
        career[issuer][index] = postRecord;

        await ctx.careerList.updateCareer(career);
        return shim.success(Career.serialize(career).toString('ascii'));
    }
    */


    async delete(ctx, email, pin, issuer){
        if (arguments.length != 4){
            return shim.error("err: Four parameters are required.");
        }
        let temp = await ctx.stub.invokeChaincode("account", new Array("queryKey", email, pin, issuer), "account");
        temp = temp.payload;
        let response = temp.buffer.toString('ascii', temp.offset, temp.limit);
    
        response = JSON.parse(response);
        if (response.status == 500){
            return shim.error("InvokeChaincode was returned 500. >> "+response.message);
        }
        
        let recordKey = response.payload;

        let career = await ctx.careerList.getCareer(recordKey);
        if (career == null){
            return shim.error("err: This career does not exist.");
        }
        ctx.careerList.deleteCareer(recordKey);
        return shim.success("deleted");
    }

    
    /**
     * (email, pin) > 해당 이력 중 현재 트랜잭션을 제안한 피어로부터 작성된 이력 삭제
     * (email, pin, recordId, recordValue) > 해당 이력 중 현재 트랜잭션을 제안한 피어가 특정하는 이력 삭제
     */
    /*
    async deleteByIssuer(ctx, email, pin, recordId, recordValue) {
        if (arguments.length != 2 && arguments.length != 4){
            return shim.error("err: Two or four parameters are required.");
        }
        let temp = await ctx.stub.invokeChaincode("account", new Array("queryKey", email, pin, "univ"), "account");
        temp = temp.payload;
        let response = temp.buffer.toString('ascii', temp.offset, temp.limit);
        console.log("#################");
        console.log(typeof response);
        console.log(response);
    
        response = JSON.parse(response);
        if (response.status == 500){
            return shim.error("InvokeChaincode was returned 500. >> "+response.payload);
        }
        
        let recordKey = response.payload;


        let career = await ctx.careerList.getCareer(recordKey);
        if (career == null){
            return shim.error("err: This career does not exist.");
        }
        if (arguments.length == 2){
            career[issuer] = [];
            await ctx.careerList.updateCareer(career);
            return shim.success(Career.serialize(career).toString('ascii'));
        } else if (arguments.length == 3){
            let index = career[issuer].findIndex(temp => temp[recordId] === recordValue);
            if (index == -1){
                return shim.error("err: This recordId does not exist in this career.");
            }
            career[issuer][index] = undefined;
            await ctx.careerList.updateCareer(career);
            return shim.success(Career.serialize(career).toString('ascii'));
        }
    }
    */
}

module.exports = CareerContract;
