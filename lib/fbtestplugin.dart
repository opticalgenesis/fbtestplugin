import 'dart:async';

import 'package:flutter/services.dart';

class Fbtestplugin {
  static const MethodChannel _channel =
      const MethodChannel('fbtestplugin');

  static Future<String> get platformVersion =>
      _channel.invokeMethod('getPlatformVersion');

  String databaseRootUrl, workingUrl;
  int childCounter = 0;

  Fbtestplugin(String url) {
    databaseRootUrl = url;
    print('Root URL is: $url');
  }

  child(String appendage) {
    childCounter++;
    if(childCounter == 1) {
      workingUrl = databaseRootUrl + appendage + "/";
    } else {
      workingUrl = workingUrl + appendage + "/";
    }
  }
}
