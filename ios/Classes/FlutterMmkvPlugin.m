#import "FlutterMmkvPlugin.h"

@implementation FlutterMmkvPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"caixin.com/flutter_kv"
            binaryMessenger:[registrar messenger]];
  FlutterMmkvPlugin* instance = [[FlutterMmkvPlugin alloc] initMMKV];
  [registrar addMethodCallDelegate:instance channel:channel];
}

-(instancetype)initMMKV{
    [self getMMKV];
    return self;
}

MMKV *mmkv;
-(MMKV*)getMMKV{
    if(mmkv == nil){
        mmkv =[MMKV defaultMMKV];
        return mmkv;
    }
    return mmkv;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  NSDictionary* arguments = [call arguments];
  NSString* key = arguments[@"key"];
  NSString* method = call.method;
  if([@"encode#int" isEqualToString:method]){
      NSNumber* intValue = arguments[@"value"];
      [[self getMMKV] setInt32:[intValue intValue] forKey:key];
      result(@YES);
  }
  else if([@"encode#bool" isEqualToString:method]){
      NSNumber* boolValue = arguments[@"value"];
      [[self getMMKV] setBool:[boolValue boolValue] forKey:key];
      result(@YES);
  }
  else if([@"encode#long" isEqualToString:method]){
      NSNumber* longValue = arguments[@"value"];
      [[self getMMKV] setInt64:[longValue longLongValue] forKey:key];
      result(@YES);
  }
  else if([@"encode#double" isEqualToString:method]){
      NSNumber* doubleValue = arguments[@"value"];
      [[self getMMKV] setDouble:[doubleValue doubleValue] forKey:key];
      result(@YES);
  }
  else if([@"encode#string" isEqualToString:method]){
      NSString* stringValue = arguments[@"value"];
      [[self getMMKV] setString:stringValue forKey:key];
      result(@YES);
  }
    
    
  else if([@"decode#int" isEqualToString:method]){
      NSNumber* defaultIntValue = arguments[@"value"];
      int32_t resultIntValue = [[self getMMKV] getInt32ForKey:key defaultValue:[defaultIntValue intValue]];
      result(@(resultIntValue));
  }
  else if([@"decode#bool" isEqualToString:method]){
     BOOL defaultBoolValue = arguments[@"value"];
     BOOL resultBoolValue = [[self getMMKV] getBoolForKey:key defaultValue:defaultBoolValue];
     result(@(resultBoolValue));
  }
    
  else if([@"decode#long" isEqualToString:method]){
      NSNumber* defaultlongValue = arguments[@"value"];
      int64_t resultLongValue = 0;
      if(defaultlongValue == nil){
          resultLongValue = [[self getMMKV] getInt64ForKey:key];
      }else{
          resultLongValue = [[self getMMKV] getInt64ForKey:key defaultValue:[defaultlongValue longLongValue]];
      }
      result(@(resultLongValue));
  }
    
  else if([@"decode#double" isEqualToString:method]){
      NSNumber* defaultDoubleValue = arguments[@"value"];
      double resultDoubleValue = 0;
      if(defaultDoubleValue == nil){
          resultDoubleValue = [[self getMMKV] getDoubleForKey:key];
      }else{
          resultDoubleValue = [[self getMMKV] getDoubleForKey:key defaultValue:[defaultDoubleValue doubleValue]];
      }
      result(@(resultDoubleValue));
  }
  else if([@"decode#string" isEqualToString:method]){
      NSString* defaultStringValue = arguments[@"value"];
      NSString* resultStringValue;
      if(defaultStringValue == nil){
          resultStringValue = [[self getMMKV] getStringForKey:key];
      }else{
          resultStringValue = [[self getMMKV] getStringForKey:key defaultValue:defaultStringValue];
      }
      result(resultStringValue);
  }
  else if([@"remove" isEqualToString:method]){
      [[self getMMKV] removeValueForKey:key];
      result(@YES);
  }
  else if([@"containsKey" isEqualToString:method]){
      BOOL resultValue = [[self getMMKV] containsKey:key];
      result(@(resultValue));
  }
  else if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
