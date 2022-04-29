// Auto-generated. Do not edit!

// (in-package executive.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Waypoint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.latitude = null;
      this.longitude = null;
      this.waypoint_number = null;
      this.is_last = null;
    }
    else {
      if (initObj.hasOwnProperty('latitude')) {
        this.latitude = initObj.latitude
      }
      else {
        this.latitude = 0.0;
      }
      if (initObj.hasOwnProperty('longitude')) {
        this.longitude = initObj.longitude
      }
      else {
        this.longitude = 0.0;
      }
      if (initObj.hasOwnProperty('waypoint_number')) {
        this.waypoint_number = initObj.waypoint_number
      }
      else {
        this.waypoint_number = 0;
      }
      if (initObj.hasOwnProperty('is_last')) {
        this.is_last = initObj.is_last
      }
      else {
        this.is_last = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Waypoint
    // Serialize message field [latitude]
    bufferOffset = _serializer.float32(obj.latitude, buffer, bufferOffset);
    // Serialize message field [longitude]
    bufferOffset = _serializer.float32(obj.longitude, buffer, bufferOffset);
    // Serialize message field [waypoint_number]
    bufferOffset = _serializer.int32(obj.waypoint_number, buffer, bufferOffset);
    // Serialize message field [is_last]
    bufferOffset = _serializer.bool(obj.is_last, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Waypoint
    let len;
    let data = new Waypoint(null);
    // Deserialize message field [latitude]
    data.latitude = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [longitude]
    data.longitude = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [waypoint_number]
    data.waypoint_number = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [is_last]
    data.is_last = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'executive/Waypoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9a56c7b6ec935796a4257037b2c62ee0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 latitude
    float32 longitude
    int32 waypoint_number
    bool is_last
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Waypoint(null);
    if (msg.latitude !== undefined) {
      resolved.latitude = msg.latitude;
    }
    else {
      resolved.latitude = 0.0
    }

    if (msg.longitude !== undefined) {
      resolved.longitude = msg.longitude;
    }
    else {
      resolved.longitude = 0.0
    }

    if (msg.waypoint_number !== undefined) {
      resolved.waypoint_number = msg.waypoint_number;
    }
    else {
      resolved.waypoint_number = 0
    }

    if (msg.is_last !== undefined) {
      resolved.is_last = msg.is_last;
    }
    else {
      resolved.is_last = false
    }

    return resolved;
    }
};

module.exports = Waypoint;
