import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_app_mvvm/app/providers/app_preferences_provider.dart';
import 'package:shop_app_mvvm/data/network/dio_factory.dart';

part 'dio_factory_provider.g.dart';

@riverpod
Future<DioFactory> dioFactory(DioFactoryRef ref) async {
  final appPreferences = await ref.read(appPreferencesProvider.future);

  return DioFactory(appPreferences);
}
