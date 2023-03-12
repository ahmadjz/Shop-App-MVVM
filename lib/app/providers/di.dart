// //TODO: This is another way of using my app modules
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shop_app_mvvm/app/app_prefs.dart';
// import 'package:shop_app_mvvm/data/data_source/remote_data_source.dart';
// import 'package:shop_app_mvvm/data/network/app_api.dart';
// import 'package:shop_app_mvvm/data/network/dio_factory.dart';
// import 'package:shop_app_mvvm/data/network/network_info.dart';
// import 'package:shop_app_mvvm/data/repository/repository_implementer.dart';
// import 'package:shop_app_mvvm/domain/repository/repository.dart';
// import 'package:shop_app_mvvm/domain/use_case/login_use_case.dart';
// import 'package:shop_app_mvvm/presentation/login/view_model/login_view_model.dart';

// final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) {
//   return SharedPreferences.getInstance();
// });

// final appPreferencesProvider = Provider<AppPreferences>((ref) {
//   return ref.watch(sharedPreferencesProvider).when(
//         data: (data) => AppPreferences(data),
//         loading: () => throw Exception("Shared preferences is still loading"),
//         error: (error, stackTrace) =>
//             throw Exception("Failed to get shared preferences: $error"),
//       );
// });

// final networkInfoProvider = Provider<NetworkInfo>((ref) {
//   return NetworkInfoImplementer(InternetConnectionChecker());
// });

// final dioFactoryProvider = Provider<DioFactory>((ref) {
//   return DioFactory(ref.watch(appPreferencesProvider));
// });

// final appServiceClientProvider = FutureProvider((ref) async {
//   final dioFactory = ref.watch(dioFactoryProvider);
//   final appServiceClient = AppServiceClient(await dioFactory.getDio());
//   return appServiceClient;
// });

// final remoteDataSourceProvider = Provider<RemoteDataSource>((ref) {
//   return ref.watch(appServiceClientProvider).when(
//         data: (data) => RemoteDataSourceImplementer(data),
//         loading: () => throw Exception("Shared preferences is still loading"),
//         error: (error, stackTrace) =>
//             throw Exception("Failed to get shared preferences: $error"),
//       );
// });

// final repositoryProvider = Provider<Repository>((ref) {
//   final remoteDataSource = ref.watch(remoteDataSourceProvider);
//   final networkInfo = ref.watch(networkInfoProvider);
//   return RepositoryImplementer(
//       remoteDataSource: remoteDataSource, networkInfo: networkInfo);
// });

// final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
//   final repository = ref.watch(repositoryProvider);
//   return LoginUseCase(repository);
// });

// final loginViewModelProvider = Provider<LoginViewModel>((ref) {
//   final loginUseCase = ref.watch(loginUseCaseProvider);
//   return LoginViewModel(loginUseCase);
// });
