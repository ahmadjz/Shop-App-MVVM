import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app_mvvm/app/providers/my_app_modules.dart';
import 'package:shop_app_mvvm/presentation/resources/assets_manager.dart';
import 'package:shop_app_mvvm/presentation/resources/color_manger.dart';
import 'package:shop_app_mvvm/presentation/resources/constants_manager.dart';
import 'package:shop_app_mvvm/presentation/resources/routes_manager.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() async {
    final appPreferences = ref.read(myAppModulesProvider).appPreferences;
    appPreferences.isUserLoggedIn().then(
      (isUserLoggedIn) {
        if (isUserLoggedIn) {
          Navigator.pushReplacementNamed(
            context,
            Routes.mainRoute,
          );
        } else {
          appPreferences
              .isOnBoardingScreenViewed()
              .then((isOnBoardingScreenViewed) {
            if (isOnBoardingScreenViewed) {
              Navigator.pushReplacementNamed(
                context,
                Routes.loginRoute,
              );
            } else {
              Navigator.pushReplacementNamed(
                context,
                Routes.onBoardingRoute,
              );
            }
          });
        }
      },
    );
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }
}
