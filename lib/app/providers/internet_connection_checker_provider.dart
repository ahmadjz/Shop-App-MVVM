import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'internet_connection_checker_provider.g.dart';

@riverpod
InternetConnectionChecker internetConnectionChecker(
    InternetConnectionCheckerRef ref) {
  return InternetConnectionChecker();
}
