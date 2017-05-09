import 'dart:async';
import 'package:dartson/dartson.dart';
import 'package:flutter/services.dart';

class Fbtestplugin {
  static const MethodChannel _channel =
      const MethodChannel('fbtestplugin');

  static Future<String> get platformVersion =>
      _channel.invokeMethod('getPlatformVersion');

  String databaseRootUrl, workingUrl, resp;

  String _responseBody;

  Fbtestplugin(String url) {
    print('Root URL is: $url');
    workingUrl = url;
  }

  child(String appendage) {
    workingUrl = workingUrl + appendage;
    print('Working URL: $workingUrl');
  }

  getValue(Object o) async {
    var httpClient = createHttpClient();
    String forJson = workingUrl + ".json";
    var valueResponse = await httpClient.get(forJson);
    print("Response code: ${valueResponse.statusCode}");

    var dson = new Dartson.JSON();

    String deser = dson.decode(valueResponse.body, o);
    _responseBody = deser;
    print("Response: ${_responseBody.toString()}");
  }

  Object retrieveData(Object o) {
    getValue(o);
    return _responseBody;
  }
}
