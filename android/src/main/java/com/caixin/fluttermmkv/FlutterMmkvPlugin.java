package com.caixin.fluttermmkv;

import com.tencent.mmkv.MMKV;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterMmkvPlugin */
public class FlutterMmkvPlugin implements MethodCallHandler {
  MMKV kv;
  private FlutterMmkvPlugin(MethodChannel channel, Registrar registrar){
    //初始化
    MMKV.initialize(registrar.context());
    kv = initMMKV();
  }

  private MMKV initMMKV() {
    if(kv == null){
      kv = MMKV.defaultMMKV();
    }
    return kv;
  }

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "kaige.com/flutter_kv");
    channel.setMethodCallHandler(new FlutterMmkvPlugin(channel,registrar));
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    String method = call.method;
    String key = call.argument("key");
    //存储时，object是将要存储的值；取值时，object是defaultValue
    Object object = call.argument("value");
    switch(method){
      case "encode#int":
        initMMKV().encode(key,(int)object);
        result.success(true);
        break;
      case "encode#bool":
        initMMKV().encode(key,(boolean)object);
        result.success(true);
        break;
      case "encode#long":
        initMMKV().encode(key,(long)object);
        result.success(true);
        break;
      case "encode#double":
        initMMKV().encode(key,(double)object);
        result.success(true);
        break;
      case "encode#string":
        initMMKV().encode(key,(String)object);
        result.success(true);
        break;


      case "decode#int":
        result.success(initMMKV().decodeInt(key,(int)object));
        break;
      case "decode#bool":
        result.success(initMMKV().decodeBool(key,(boolean)object));
        break;
      case "decode#long":
        //int不能强转long, 会抛类型转换异常;所以使用Integer和Long的父类Number中转一下
        Number number = (Number) object;
        result.success(initMMKV().decodeLong(key, number.longValue()));
        break;
      case "decode#double":
        result.success(initMMKV().decodeDouble(key,(double)object));
        break;
      case "decode#string":
        result.success(initMMKV().decodeString(key,(String)object));
        break;


      case "remove":
        initMMKV().removeValueForKey(key);
        result.success(true);
        break;
      case "containsKey":
        result.success(initMMKV().contains(key));
        break;
      case "getPlatformVersion":
        result.success("Android " + android.os.Build.VERSION.RELEASE);
        break;
      default:
        result.notImplemented();
    }
  }
}
