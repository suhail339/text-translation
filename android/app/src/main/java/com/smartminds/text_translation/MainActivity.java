package com.smartminds.text_translation;

import android.os.Bundle;
import android.widget.Toast;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity implements MethodChannel.MethodCallHandler {

    private static final String CHANNEL = "smartminds.com.text_translation.channel";
    MethodChannel channel;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        channel = new MethodChannel(getFlutterView(), CHANNEL);
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        switch (methodCall.method) {
            case "testing":
                Toast.makeText(this, "Testing method channel", Toast.LENGTH_SHORT).show();
                result.success("Method Channel Success");
                break;
            case "getLanguages":
                channel.invokeMethod("setLanguages", "Hello from native host");
                break;
            default:
                result.notImplemented();
        }
    }
}
