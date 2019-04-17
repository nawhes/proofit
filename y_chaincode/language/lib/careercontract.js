'use strict';

const { Contract, Context } = require('fabric-contract-api');
const ClientIdentity = require('fabric-shim').ClientIdentity;
const shim = require('fabric-shim');

const Career = require('./career.js');
const CareerList = require('./careerlist.js');

const channelName = "language";

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

    /**
     * Define a custom context for commercial paper
    */
    createContext() {
        return new CareerContext();
    }

    /**
     * Instantiate to perform any setup of the ledger that might be required.
     * @param {Context} ctx the transaction context
     */
    async instantiate(ctx) {
        // No implementation required with this example
        // It could be where data migration is performed, if necessary
        console.log('Instantiate the contract');
    }

    async query(ctx, recordKey) {
        let career = await ctx.careerList.getCareer(recordKey);
        return shim.success(Buffer.from(career.toBuffer()).toString('ascii'));
    }

    async queryByIssuer(ctx, recordKey, issuer) {
        let career = await ctx.careerList.getCareer(recordKey);
        return shim.success(Buffer.from(career[issuer].toBuffer()).toString('ascii'));
    }

    async input(ctx, recordKey, record) {
        // let authority = new ClientIdentity(stub);
        // let issuer = authority.getAttributeValue(attrName);
        let issuer = "test";

        if ( issuer == "" || issuer == null || issuer == undefined || ( issuer != null && typeof issuer == "object" && !Object.keys(issuer).length ) ) {
            //check permission
            //return shim.console.error("Authorization failed");
	    return "failed";
        }
        else {
            var testIssuer = {
                issuer: "test"
            }
            //preparation
            let record_JSON = JSON.parse(record);
            Object.assign(record_JSON,testIssuer);
            // record_JSON.issueby = issuer;

            let career = await ctx.careerList.getCareer(recordKey);
            if ( career == "" || career == null || career == undefined || ( career != null && typeof career == "object" && !Object.keys(career).length ) ) {

                career = Career.createInstance(recordKey);
                career[issuer] = [];
                career[issuer].push(record_JSON);
                await ctx.careerList.addCareer(career);
  
            } else { // career != null
                career[issuer].push(record_JSON);
                await ctx.careerList.updateCareer(career);  
            }

            return shim.success(Buffer.from(JSON.stringify(career)).toString('ascii'));

        }
    }

    async update(ctx, recordKey, record) {
        // let authority = new ClientIdentity(stub);
        // let issuer = authority.getAttributeValue(attrName);
        let issuer = "test";
        if (issuer !== null) { //check permission
            let career = await ctx.careerList.getCareer(ctx, recordKey);

            // preparation
            let record_JSON = JSON.parse(record);
            Object.assign(record_JSON, { issueby: issuer });

            let index = career.findIndex(temp => temp.issueby === issuer);

            career[index] = career_JSON;
            await ctx.careerList.updateCareer(career);
            return shim.success(Buffer.from(career.toBuffer()).toString('ascii'));

        }
        else {
	    return "failed";
            //return shim.console.error("Authorization failed");
        }
    }
}

module.exports = CareerContract;
