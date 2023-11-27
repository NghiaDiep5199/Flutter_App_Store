import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shop_application/provider/cart_provider.dart';
import 'package:shop_application/provider/product_provider.dart';
import 'package:shop_application/vendor/views/auth/vendor_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyDtK660B6FRifJfcKcqoySSZqzzwQWEkzc",
              appId: "1:195971740928:android:f73f66762d822019c3afe5",
              messagingSenderId: "195971740928",
              projectId: "flutter-store-app-1c9ac",
              storageBucket: "flutter-store-app-1c9ac.appspot.com"),
        )
      : await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) {
      return ProductProvider();
    }),
    ChangeNotifierProvider(create: (_) {
      return CartProvider();
    })
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Store App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Brand-Bold',
      ),
      home: VendorAuthScreen(),
      builder: EasyLoading.init(),
    );
  }
}
