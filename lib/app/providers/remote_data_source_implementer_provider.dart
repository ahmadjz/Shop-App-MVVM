import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_app_mvvm/app/providers/app_service_client_provider.dart';
import 'package:shop_app_mvvm/data/data_source/remote_data_source.dart';

part 'remote_data_source_implementer_provider.g.dart';

@riverpod
Future<RemoteDataSourceImplementer> remoteDataSourceImplementer(
    RemoteDataSourceImplementerRef ref) async {
  return RemoteDataSourceImplementer(
    await ref.read(appServiceClientProvider.future),
  );
}
