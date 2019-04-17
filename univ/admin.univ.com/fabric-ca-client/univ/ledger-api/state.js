"use strict";

class State {

  constructor(stateClass) {
    this.class = stateClass;
  }

  getClass() {
    return this.class;
  }

  serialize() {
    return State.serialize(this);
  }

  static serialize(object) {
    return Buffer.from(JSON.stringify(object));
  }

  static deserialize(data, supportedClasses) {
    let json = JSON.parse(data.toString());
    let objClass = supportedClasses[json.class];
    if (!objClass) {
      throw new Error(`Unknown class of ${json.class}`);
    }
    let object = new objClass(json);

    return object;
  }

  static deserializeClass(data, objClass) {
    let json = JSON.parse(data.toString());
    let object = new objClass(json);
    return object;
  }
}

module.exports = State;
