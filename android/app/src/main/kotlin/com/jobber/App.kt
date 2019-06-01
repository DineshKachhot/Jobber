package com.jobber

import android.content.Context
import io.flutter.app.FlutterApplication
import android.support.multidex.MultiDex
import com.google.firebase.firestore.FirebaseFirestore
import com.google.firebase.firestore.FirebaseFirestoreSettings


class App : FlutterApplication(){

    override fun onCreate() {
        super.onCreate()
        val db = FirebaseFirestore.getInstance();
        val settings = FirebaseFirestoreSettings.Builder()
                .setPersistenceEnabled(true)
                .setTimestampsInSnapshotsEnabled(true)
                .build();
        db.setFirestoreSettings(settings);

    }

    override fun attachBaseContext(base: Context) {
        super.attachBaseContext(base)
        MultiDex.install(this)
    }

}