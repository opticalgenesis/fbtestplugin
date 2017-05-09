import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

class Fbtestplugin {
  static const MethodChannel _channel =
      const MethodChannel('fbtestplugin');

  static Future<String> get platformVersion =>
      _channel.invokeMethod('getPlatformVersion');

  String databaseRootUrl, workingUrl;

  Fbtestplugin(String url) {
    print('Root URL is: $url');
    workingUrl = url;
  }

  child(String appendage) {
    workingUrl = workingUrl + appendage;
    print('Working URL: $workingUrl');
  }

  getValue() async {
    var httpClient = createHttpClient();
    String forJson = workingUrl + ".json";
    var valueResponse = await httpClient.get(forJson);
    print("Response code: ${valueResponse.statusCode}");
  }
}
