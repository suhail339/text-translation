package com.smartminds.text_translation;

import com.google.cloud.translate.Language;

import java.util.List;

public interface TranslatorCallBack {

    void onLanguagesRecieved(List<Language> languages);
}
