// Auto-generated. Do not edit!

// (in-package distance_sensor.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Distance {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.distance_front = null;
      this.distance_left = null;
      this.distance_right = null;
    }
    else {
      if (initObj.hasOwnProperty('distance_front')) {
        this.distance_front = initObj.distance_front
      }
      else {
        this.distance_front = 0.0;
      }
      if (initObj.hasOwnProperty('distance_left')) {
        this.distance_left = initObj.distance_left
      }
      else {
        this.distance_left = 0.0;
      }
      if (initObj.hasOwnProperty('distance_right')) {
        this.distance_right = initObj.distance_right
      }
      else {
        this.distance_right = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Distance
    // Serialize message field [distance_front]
    bufferOffset = _serializer.float64(obj.distance_front, buffer, bufferOffset);
    // Serialize message field [distance_left]
    bufferOffset = _serializer.float64(obj.distance_left, buffer, bufferOffset);
    // Serialize message field [distance_right]
    bufferOffset = _serializer.float64(obj.distance_right, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Distance
    let len;
    let data = new Distance(null);
    // Deserialize message field [distance_front]
    data.distance_front = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance_left]
    data.distance_left = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance_right]
    data.distance_right = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'distance_sensor/Distance';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0cdc47dfe636ccbe1ecabbc8b3b2dd90';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 distance_front
    float64 distance_left
    float64 distance_right
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Distance(null);
    if (msg.distance_front !== undefined) {
      resolved.distance_front = msg.distance_front;
    }
    else {
      resolved.distance_front = 0.0
    }

    if (msg.distance_left !== undefined) {
      resolved.distance_left = msg.distance_left;
    }
    else {
      resolved.distance_left = 0.0
    }

    if (msg.distance_right !== undefined) {
      resolved.distance_right = msg.distance_right;
    }
    else {
      resolved.distance_right = 0.0
    }

    return resolved;
    }
};

module.exports = Distance;
