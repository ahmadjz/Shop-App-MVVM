import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app_mvvm/app/app_prefs.dart';
import 'package:shop_app_mvvm/app/providers/my_app_modules.dart';
import 'package:shop_app_mvvm/presentation/resources/routes_manager.dart';
import 'package:shop_app_mvvm/presentation/resources/theme_manager.dart';

class MyApp extends ConsumerStatefulWidget {
  MyApp._internal();
  static final MyApp _instance = MyApp._internal(); // Singleton
  factory MyApp() => _instance;

  int appState = 0;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late AppPreferences appPreferences;

  @override
  void didChangeDependencies() {
    final myAppModules = ref.read(myAppModulesProvider);
    myAppModules.initAppModule().then((value) {
      appPreferences = myAppModules.appPreferences;
      appPreferences.getLocal().then((local) => {context.setLocale(local)});
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: getApplicationTheme(),
    );
  }
}
