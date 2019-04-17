/*
SPDX-License-Identifier: Apache-2.0
*/

"use strict";

const StateList = require("../ledger-api/statelist.js");

const Career = require("./career.js");

const channelName = "license";

class CareerList extends StateList {
  constructor(ctx) {
    super(ctx, channelName+"list");
    this.use(Career);
  }

  async addCareer(career) {
    return this.addState(career);
  }

  async getCareer(recordKey) {
    return this.getState(recordKey);
  }

  async updateCareer(career) {
    return this.updateState(career);
  }
}

module.exports = CareerList;
