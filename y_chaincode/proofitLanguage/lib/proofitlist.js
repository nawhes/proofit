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

  async addProofit(proofit) {
    return this.addState(proofit);
  }

  async getProofit(email) {
    return this.getState(email);
  }

  async updateProofit(proofit) {
    return this.updateState(proofit);
  }

  async deleteProofit(proofit) {
    return this.deleteState(proofit);
  }
}

module.exports = ProofitList;
