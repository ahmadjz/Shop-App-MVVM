import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_mvvm/data/data_source/remote_data_source.dart';
import 'package:shop_app_mvvm/data/network/app_api.dart';
import 'package:shop_app_mvvm/data/network/dio_factory.dart';
import 'package:shop_app_mvvm/data/network/network_info.dart';
import 'package:shop_app_mvvm/data/repository/repository_implementer.dart';
import 'package:shop_app_mvvm/domain/repository/repository.dart';
import 'package:shop_app_mvvm/domain/use_case/login_use_case.dart';

import 'app_prefs.dart';

class MyAppInitializers {
  late SharedPreferences sharedPreferences;
  late AppPreferences appPreferences;
  late InternetConnectionChecker internetConnectionChecker;
  late NetworkInfo networkInfo;
  late DioFactory dioFactory;
  late AppServiceClient appServiceClient;
  late RemoteDataSource remoteDataSource;
  late Repository repository;
  late LoginUseCase
      loginUseCase; //TODO: This case should be seperated in its own initialize

  Future<void> initAppModule() async {
    sharedPreferences = await SharedPreferences.getInstance();
    appPreferences = AppPreferences(sharedPreferences);
    internetConnectionChecker = InternetConnectionChecker();
    networkInfo = NetworkInfoImplementation(internetConnectionChecker);
    dioFactory = DioFactory(appPreferences);
    appServiceClient = AppServiceClient(await dioFactory.getDio());
    remoteDataSource = RemoteDataSourceImplementation(appServiceClient);
    repository = RepositoryImplementer(
      remoteDataSource: remoteDataSource,
      networkInfo: networkInfo,
    );
    loginUseCase = LoginUseCase(repository);
  }
}

final myAppInitializersProvider = Provider<MyAppInitializers>(
  (ref) => MyAppInitializers(),
);
