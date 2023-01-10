import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/presentation/theme_magner.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();
  static final MyApp _instance = MyApp._internal(); // Singleton
  factory MyApp() => _instance;

  int appState = 0;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: getApplicationTheme(),
      home: Container(),
    );
  }
}
