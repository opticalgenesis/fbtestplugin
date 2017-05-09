package com.yourcompany.fbtestplugin;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;

/**
 * FbtestpluginPlugin
 */
public class FbtestpluginPlugin implements MethodCallHandler {
  private FlutterActivity activity;

  public static FbtestpluginPlugin register(FlutterActivity activity) {
    return new FbtestpluginPlugin(activity);
  }

  private FbtestpluginPlugin(FlutterActivity activity) {
    this.activity = activity;
    new MethodChannel(activity.getFlutterView(), "fbtestplugin").setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else {
      result.notImplemented();
    }
  }
}
