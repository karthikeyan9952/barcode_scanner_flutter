import 'package:barcode_scanner/providers/all_providers.dart';
import 'package:barcode_scanner/screens/splash_screen.dart';
import 'package:barcode_scanner/utils/keys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: providersAll, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: appKey,
      title: 'Barcode and QRcode Scanner',
      theme: ThemeData(
        primarySwatch: primary,
      ),
      home: const SplashScreen(),
    );
  }
}

MaterialColor primary = Colors.indigo;
