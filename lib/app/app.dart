import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_mvvm/app/dependency_injection.dart';
import 'package:shop_app_mvvm/presentation/animations/loading_animation_view.dart';
import 'package:shop_app_mvvm/presentation/resources/routes_manager.dart';
import 'package:shop_app_mvvm/presentation/resources/theme_manager.dart';

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
    return Consumer(
      builder: (context, ref, child) {
        final myAppInitializers = ref.watch(myAppInitializersProvider);
        return FutureBuilder(
          future: myAppInitializers.initAppModule(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return MaterialApp(
                onGenerateRoute: RouteGenerator.getRoute,
                initialRoute: Routes.splashRoute,
                debugShowCheckedModeBanner: false,
                title: 'Shop App',
                theme: getApplicationTheme(),
              );
            }
            return const LoadingAnimationView();
          },
        );
      },
    );
  }
}
