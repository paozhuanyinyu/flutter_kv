import 'dart:async';

import 'package:flutter/services.dart';

class FlutterKV {
  static const MethodChannel _channel =
      const MethodChannel('kaige.com/flutter_kv');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool> encodeInt(String key,int value) async{
    var argument = {
      'key': key,
      'value': value
    };
    return await _channel.invokeMethod('encode#int',argument);
  }
  static Future<bool> encodeBool(String key,bool value) async{
    var argument = {
      'key': key,
      'value': value
    };
    return await _channel.invokeMethod('encode#bool',argument);
  }
  static Future<bool> encodeLong(String key,int value) async{
    var argument = {
      'key': key,
      'value': value
    };
    return await _channel.invokeMethod('encode#long',argument);
  }

  static Future<bool> encodeDouble(String key,double value) async{
    var argument = {
      'key': key,
      'value': value
    };
    return await _channel.invokeMethod('encode#double',argument);
  }

  static Future<bool> encodeString(String key,String value) async{
    var argument = {
      'key': key,
      'value': value
    };
    return await _channel.invokeMethod('encode#string',argument);
  }




  static Future<int> decodeInt(String key,[int defaultValue = 0]) async{
    var argument = {
      'key': key,
      'value': defaultValue
    };
    return await _channel.invokeMethod('decode#int',argument);
  }

  static Future<bool> decodeBool(String key,[bool defaultValue = false]) async{
    var argument = {
      'key': key,
      'value': defaultValue
    };
    return await _channel.invokeMethod('decode#bool',argument);
  }

  static Future<int> decodeLong(String key,[int value = 0]) async{
    var argument = {
      'key': key,
      'value': value
    };
    return await _channel.invokeMethod('decode#long',argument);
  }

  static Future<double> decodeDouble(String key,[double defaultValue = 0]) async{
    var argument = {
      'key': key,
      'value': defaultValue
    };
    return await _channel.invokeMethod('decode#double',argument);
  }
  static Future<String> decodeString(String key,[String defaultValue = ""]) async{
    var argument = {
      'key': key,
      'value': defaultValue
    };
    return await _channel.invokeMethod('decode#string',argument);
  }


  static Future<bool> remove(String key) async{
    var argument = {
      'key': key,
    };
    return await _channel.invokeMethod('remove',argument);
  }

  static Future<bool> containsKey(String key) async{
    var argument = {
      'key': key,
    };
    return await _channel.invokeMethod('containsKey',argument);
  }
}
