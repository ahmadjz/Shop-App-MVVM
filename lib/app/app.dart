import 'package:flutter/material.dart';

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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Container(),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  void updateAppState() {
    MyApp().appState = 11;
  }

  void getAppState() {
    print(MyApp().appState);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
