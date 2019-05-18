/*
SPDX-License-Identifier: Apache-2.0
*/

"use strict";

const StateList = require("../ledger-api/statelist.js");

const Career = require("./career.js");

const channelName = "univ";

class CareerList extends StateList {
  constructor(ctx) {
    super(ctx, channelName+"list-");
    this.use(Career);
  }

  async addCareer(key, career) {
    return this.addState(key, career);
  }

  async getCareer(key) {
    return this.getState(key);
  }

  async updateCareer(key, career) {
    return this.updateState(key, career);
  }

  async deleteCareer(key) {
    return this.deleteState(key);
  }
}

module.exports = CareerList;
