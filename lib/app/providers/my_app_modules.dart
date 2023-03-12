import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_mvvm/app/app_prefs.dart';
import 'package:shop_app_mvvm/data/data_source/remote_data_source.dart';
import 'package:shop_app_mvvm/data/network/app_api.dart';
import 'package:shop_app_mvvm/data/network/dio_factory.dart';
import 'package:shop_app_mvvm/data/network/network_info.dart';
import 'package:shop_app_mvvm/data/repository/repository_implementer.dart';
import 'package:shop_app_mvvm/domain/repository/repository.dart';
import 'package:shop_app_mvvm/domain/use_case/forgot_password_use_case.dart';
import 'package:shop_app_mvvm/domain/use_case/home_use_case.dart';
import 'package:shop_app_mvvm/domain/use_case/login_use_case.dart';
import 'package:shop_app_mvvm/domain/use_case/register_use_case.dart';

class MyAppModules {
  late SharedPreferences sharedPreferences;
  late AppPreferences appPreferences;
  late InternetConnectionChecker internetConnectionChecker;
  late NetworkInfo networkInfo;
  late DioFactory dioFactory;
  late AppServiceClient appServiceClient;
  late RemoteDataSource remoteDataSource;
  late Repository repository;
  final ImagePicker imagePicker = ImagePicker();
  LoginUseCase? loginUseCase;
  ForgotPasswordUseCase? forgotPasswordUseCase;
  RegisterUseCase? registerUseCase;
  HomeUseCase? homeUseCase;

  Future<void> initAppModule() async {
    sharedPreferences = await SharedPreferences.getInstance();
    appPreferences = AppPreferences(sharedPreferences);
    internetConnectionChecker = InternetConnectionChecker();
    networkInfo = NetworkInfoImplementer(internetConnectionChecker);
    dioFactory = DioFactory(appPreferences);
    appServiceClient = AppServiceClient(await dioFactory.getDio());
    remoteDataSource = RemoteDataSourceImplementer(appServiceClient);
    repository = RepositoryImplementer(
      remoteDataSource: remoteDataSource,
      networkInfo: networkInfo,
    );
  }

  LoginUseCase initLoginUseCase() {
    loginUseCase = loginUseCase ?? LoginUseCase(repository);
    return loginUseCase!;
  }

  ForgotPasswordUseCase initForgotPasswordUseCase() {
    forgotPasswordUseCase =
        forgotPasswordUseCase ?? ForgotPasswordUseCase(repository);
    return forgotPasswordUseCase!;
  }

  RegisterUseCase initRegisterUseCase() {
    registerUseCase = registerUseCase ?? RegisterUseCase(repository);
    return registerUseCase!;
  }

  HomeUseCase initHomeUseCase() {
    homeUseCase = homeUseCase ?? HomeUseCase(repository);
    return homeUseCase!;
  }
}

final myAppModulesProvider = Provider<MyAppModules>(
  (_) => MyAppModules(),
);
