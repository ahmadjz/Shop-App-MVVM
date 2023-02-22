import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_app_mvvm/app/providers/dio_factory_provider.dart';
import 'package:shop_app_mvvm/data/network/app_api.dart';

part 'app_service_client_provider.g.dart';

@riverpod
Future<AppServiceClient> appServiceClient(AppServiceClientRef ref) async {
  final dio = await ref.read(dioFactoryProvider.future);
  return AppServiceClient(await dio.getDio());
}
