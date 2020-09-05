// GENERATED CODE -- DO NOT EDIT!

'use strict';
var grpc = require('grpc');
var proto_mer_auth_pb = require('../proto/mer_auth_pb.js');

function serialize_MerchAuth_MerchantSignupRequest(arg) {
  if (!(arg instanceof proto_mer_auth_pb.MerchantSignupRequest)) {
    throw new Error('Expected argument of type MerchAuth.MerchantSignupRequest');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_MerchAuth_MerchantSignupRequest(buffer_arg) {
  return proto_mer_auth_pb.MerchantSignupRequest.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_MerchAuth_MerchantSignupResponse(arg) {
  if (!(arg instanceof proto_mer_auth_pb.MerchantSignupResponse)) {
    throw new Error('Expected argument of type MerchAuth.MerchantSignupResponse');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_MerchAuth_MerchantSignupResponse(buffer_arg) {
  return proto_mer_auth_pb.MerchantSignupResponse.deserializeBinary(new Uint8Array(buffer_arg));
}


var MerchantAuthService = exports.MerchantAuthService = {
  merchAuth: {
    path: '/MerchAuth.MerchantAuth/MerchAuth',
    requestStream: false,
    responseStream: false,
    requestType: proto_mer_auth_pb.MerchantSignupRequest,
    responseType: proto_mer_auth_pb.MerchantSignupResponse,
    requestSerialize: serialize_MerchAuth_MerchantSignupRequest,
    requestDeserialize: deserialize_MerchAuth_MerchantSignupRequest,
    responseSerialize: serialize_MerchAuth_MerchantSignupResponse,
    responseDeserialize: deserialize_MerchAuth_MerchantSignupResponse,
  },
};

exports.MerchantAuthClient = grpc.makeGenericClientConstructor(MerchantAuthService);
