package com.smartminds.text_translation;

import android.os.AsyncTask;
import android.os.Bundle;
import android.widget.Toast;

import com.google.cloud.translate.Language;
import com.google.cloud.translate.Translate;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;
import com.google.gson.Gson;

import java.util.List;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity implements MethodChannel.MethodCallHandler, TranslatorCallBack {

    private static final String CHANNEL = "smartminds.com.text_translation.channel";
    MethodChannel channel;
    private TranslateOptions translate_options;
    public static Translate google_translate;

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
            case "configTranslator":
                configTranslator(methodCall.arguments.toString());
                break;
            case "getLanguages":
                new RetrieveLanguages(google_translate, this::onLanguagesRecieved).execute();
                break;
            case "translate":
                translate(methodCall.arguments.toString(),"fa");
                break;
            default:
                result.notImplemented();
        }
    }

    void configTranslator(String key) {
        AsyncTask.execute(new Runnable() {
            @Override
            public void run() {
                //TODO your background code
                translate_options = TranslateOptions.newBuilder()
                        .setApiKey(key)
                        .build();

                google_translate = translate_options.getService();
            }
        });
    }

    void translate(String text, String lang){
        AsyncTask.execute(new Runnable() {
            @Override
            public void run() {
                //TODO your background code
                final Translation translation =
                        google_translate.translate(text,
                                Translate.TranslateOption.targetLanguage(lang));
                channel.invokeMethod("translation", translation.getTranslatedText());
            }
        });
    }
    @Override
    public void onLanguagesRecieved(List<Language> languages) {
        channel.invokeMethod("setLanguages", new Gson().toJson(languages));
    }
}
