/*
SPDX-License-Identifier: Apache-2.0
*/

"use strict";

const StateList = require("../ledger-api/statelist.js");

const Account = require("./account.js");

const channelName = "account";

class AccountList extends StateList {
  constructor(ctx) {
    super(ctx, channelName+"list");
    this.use(Account);
  }

  async addAccount(account) {
    return this.addState(account);
  }

  async getAccount(email) {
    return this.getState(email);
  }

  async updateAccount(account) {
    return this.updateState(account);
  }

  async deleteAccount(account) {
    return this.deleteState(account);
  }
}

module.exports = AccountList;
