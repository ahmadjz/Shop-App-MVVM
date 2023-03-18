import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app_mvvm/app/app.dart';
import 'package:shop_app_mvvm/presentation/resources/language_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          arabicLocale,
          englishLocale,
        ],
        path: assetPathLocalization,
        child: Phoenix(
          child: ProviderScope(
            child: MyApp(),
          ),
        )),
  );
}
