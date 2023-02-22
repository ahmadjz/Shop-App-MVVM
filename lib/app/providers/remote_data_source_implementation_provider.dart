import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_app_mvvm/app/providers/app_service_client_provider.dart';
import 'package:shop_app_mvvm/data/data_source/remote_data_source.dart';

part 'remote_data_source_implementation_provider.g.dart';

@riverpod
Future<RemoteDataSourceImplementation> remoteDataSourceImplementation(
    RemoteDataSourceImplementationRef ref) async {
  return RemoteDataSourceImplementation(
    await ref.read(appServiceClientProvider.future),
  );
}
