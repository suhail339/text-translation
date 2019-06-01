import 'package:flutter/services.dart';

class TextChannel {
  static String api_key = "AIzaSyBoXignvDb9xo1qS0n4i5tmnpD_t9ldRME";
  static const text_channel =
      const MethodChannel('smartminds.com.text_translation.channel');

  static void setMethodHandler(_handler) {
    text_channel.setMethodCallHandler(_handler);
  }

  static Future<String> testChannel() async {
    String res = await text_channel.invokeMethod('testing');
    print(res);
    return res;
  }

  static void configTranslator() async{
    await text_channel.invokeMethod("configTranslator",api_key);
  }
  static Future<String> getLanguages() async {
    await text_channel.invokeMethod('getLanguages');
  }

  static Future<String> translate(value) async {
    await text_channel.invokeMethod('translate',value);
  }
}
