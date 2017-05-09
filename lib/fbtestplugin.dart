import 'dart:async';

import 'package:flutter/services.dart';

class Fbtestplugin {
  static const MethodChannel _channel =
      const MethodChannel('fbtestplugin');

  static Future<String> get platformVersion =>
      _channel.invokeMethod('getPlatformVersion');

  String mUrl;

  setUrl(String url) {
    this.mUrl = url;
    print(url);
  }
}
