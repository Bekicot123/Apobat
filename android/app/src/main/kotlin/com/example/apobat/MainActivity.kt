package com.example.apobat

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Tidak perlu memanggil FirebaseApp.initializeApp() di sini
    }
}
