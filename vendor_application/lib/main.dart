import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:vendor_application/vendor/views/auth/vendor_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyDtK660B6FRifJfcKcqoySSZqzzwQWEkzc",
              appId: "1:195971740928:android:bce759d561e85329c3afe5",
              messagingSenderId: "195971740928",
              projectId: "flutter-store-app-1c9ac",
              storageBucket: "flutter-store-app-1c9ac.appspot.com"),
        )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        // ignore: prefer_const_constructors
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VendorAuthScreen(),
      builder: EasyLoading.init(),
    );
  }
}
