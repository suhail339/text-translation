package com.smartminds.text_translation;

import android.os.AsyncTask;

import com.google.cloud.translate.Language;
import com.google.cloud.translate.Translate;
import com.google.cloud.translate.TranslateOptions;

import java.util.ArrayList;
import java.util.List;

public class RetrieveLanguages extends AsyncTask<List<Language>, Integer, List<Language>> {
    List<Language> languages = new ArrayList<>();
    Translate google_translate;
    TranslatorCallBack translatorCallBack;

    public RetrieveLanguages(Translate google_translate, TranslatorCallBack translatorCallBack) {
        this.google_translate = google_translate;
        this.translatorCallBack = translatorCallBack;
    }

    @Override
    protected void onPreExecute() {
        super.onPreExecute();
        // Do something like display a progress bar
    }

    @Override
    protected List<Language> doInBackground(List<Language>... params) {

        languages = google_translate.listSupportedLanguages();

        return languages;
    }

    @Override
    protected void onPostExecute(List<Language> languages) {
        super.onPostExecute(languages);
        translatorCallBack.onLanguagesRecieved(languages);
    }
}