/*
SPDX-License-Identifier: Apache-2.0
*/

"use strict";

/**
 * State class. States have a class, unique key, and a lifecycle current state
 * the current state is determined by the specific subclass
 */
class State {
  /**
   * @param {String|Object} class  An indentifiable class of the instance
   * @param {keyParts[]} elements to pull together to make a key for the objects
   */
  constructor(stateClass) {
    this.class = stateClass;
  }

  getClass() {
    return this.class;
  }

  serialize() {
    return State.serialize(this);
  }

  /**
   * Convert object to buffer containing JSON data serialization
   * Typically used before putState()ledger API
   * @param {Object} JSON object to serialize
   * @return {buffer} buffer with the data to store
   */
  static serialize(object) {
    return Buffer.from(JSON.stringify(object));
  }

  /**
   * Deserialize object into one of a set of supported JSON classes
   * i.e. Covert serialized data to JSON object
   * Typically used after getState() ledger API
   */
  static deserialize(data) {
    return JSON.parse(data.toString());
  }
}

module.exports = State;
