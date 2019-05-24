/*
SPDX-License-Identifier: Apache-2.0
*/

"use strict";

const StateList = require("../ledger-api/statelist.js");

const Proofit = require("./proofit.js");

const channelName = "proofit";

class ProofitList extends StateList {
  constructor(ctx) {
    super(ctx, channelName+"list-");
    this.use(Proofit);
  }

  async addProofit(key, proofit) {
    return this.addState(key, proofit);
  }

  async getProofit(key) {
    return this.getState(key);
  }

  async updateProofit(key, proofit) {
    return this.updateState(key, proofit);
  }

  async deleteProofit(key) {
    return this.deleteState(key);
  }
}

module.exports = ProofitList;
