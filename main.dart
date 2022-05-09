// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const customSwatch = MaterialColor(
    0xFFFF5252,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFFF5252),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customSwatch,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("In App Review"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openAppReview,
          child: Text('Demo',),
        ),
      ),
    );
  }

  void _openAppReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {

      /// NOTE: use this SPARINGLY -> restricted by quota
      /// triggers the In-App Review prompt
      //inAppReview.requestReview();

      /// NOTE: NOT restricted by quota
      ///
      /// opens:
      /// - Google Play Store on Android,
      /// - App Store with a review screen on IOS & MacOS
      /// - Microsoft Store on Windows.
      ///
      /// Use this if you want to permanently provide a button or other
      /// call-to-action to let users leave a review
      ///
      /// appStoreId is only required on IOS and MacOS and can be found in
      /// App Store Connect under General > App Information > Apple ID.
      ///   exp: https://apps.apple.com/app/app-name/id1111111111
      ///     -> id: id1111111111
      ///
      /// microsoftStoreId is only required on Windows:
      ///   exp: https://www.microsoft.com/store/apps/<microsoftStoreId>
      inAppReview.openStoreListing(
        appStoreId: '...',
        microsoftStoreId: '...',
      );
    }
  }

}

