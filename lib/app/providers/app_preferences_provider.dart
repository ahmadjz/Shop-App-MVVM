import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_app_mvvm/app/app_prefs.dart';
import 'package:shop_app_mvvm/app/providers/shared_preferences_provider.dart';

part 'app_preferences_provider.g.dart';

@riverpod
Future<AppPreferences> appPreferences(AppPreferencesRef ref) async {
  final sharedPreferences = await ref.read(sharedPreferencesProvider.future);

  return AppPreferences(sharedPreferences);
}
