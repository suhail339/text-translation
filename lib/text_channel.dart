import 'package:flutter/services.dart';

class TextChannel {
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

  static Future<String> getLanguages() async {
    String res = await text_channel.invokeMethod('getLanguages');
    return res;
  }
}
