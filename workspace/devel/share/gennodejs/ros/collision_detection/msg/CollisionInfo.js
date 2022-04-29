// Auto-generated. Do not edit!

// (in-package collision_detection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Obstacle = require('./Obstacle.js');

//-----------------------------------------------------------

class CollisionInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.left = null;
      this.center = null;
      this.right = null;
    }
    else {
      if (initObj.hasOwnProperty('left')) {
        this.left = initObj.left
      }
      else {
        this.left = new Obstacle();
      }
      if (initObj.hasOwnProperty('center')) {
        this.center = initObj.center
      }
      else {
        this.center = new Obstacle();
      }
      if (initObj.hasOwnProperty('right')) {
        this.right = initObj.right
      }
      else {
        this.right = new Obstacle();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CollisionInfo
    // Serialize message field [left]
    bufferOffset = Obstacle.serialize(obj.left, buffer, bufferOffset);
    // Serialize message field [center]
    bufferOffset = Obstacle.serialize(obj.center, buffer, bufferOffset);
    // Serialize message field [right]
    bufferOffset = Obstacle.serialize(obj.right, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CollisionInfo
    let len;
    let data = new CollisionInfo(null);
    // Deserialize message field [left]
    data.left = Obstacle.deserialize(buffer, bufferOffset);
    // Deserialize message field [center]
    data.center = Obstacle.deserialize(buffer, bufferOffset);
    // Deserialize message field [right]
    data.right = Obstacle.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'collision_detection/CollisionInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a174fa88f0c00f2e81e61d98593bf57f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Obstacle left
    Obstacle center
    Obstacle right
    ================================================================================
    MSG: collision_detection/Obstacle
    float64 distance
    float64 priority
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CollisionInfo(null);
    if (msg.left !== undefined) {
      resolved.left = Obstacle.Resolve(msg.left)
    }
    else {
      resolved.left = new Obstacle()
    }

    if (msg.center !== undefined) {
      resolved.center = Obstacle.Resolve(msg.center)
    }
    else {
      resolved.center = new Obstacle()
    }

    if (msg.right !== undefined) {
      resolved.right = Obstacle.Resolve(msg.right)
    }
    else {
      resolved.right = new Obstacle()
    }

    return resolved;
    }
};

module.exports = CollisionInfo;
