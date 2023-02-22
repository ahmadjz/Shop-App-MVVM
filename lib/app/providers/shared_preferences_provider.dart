import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_provider.g.dart';

@riverpod
Future<SharedPreferences> sharedPreferences(SharedPreferencesRef ref) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  print("Hiiiii0");
  return sharedPreferences;
}
