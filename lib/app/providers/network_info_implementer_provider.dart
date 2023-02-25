import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_app_mvvm/app/providers/internet_connection_checker_provider.dart';
import 'package:shop_app_mvvm/data/network/network_info.dart';

part 'network_info_implementer_provider.g.dart';

@riverpod
NetworkInfoImplementer networkInfoImplementer(NetworkInfoImplementerRef ref) {
  return NetworkInfoImplementer(
    ref.read(
      internetConnectionCheckerProvider,
    ),
  );
}
