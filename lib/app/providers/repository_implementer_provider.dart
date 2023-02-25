import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_app_mvvm/data/repository/repository_implementer.dart';

part 'repository_implementer_provider.g.dart';

@riverpod
Future<RepositoryImplementer> repositoryImplementer(
    RepositoryImplementerRef ref) async {
  final remoteDataSource =
      await ref.read(remoteDataSourceImplementerProvider.future);
  final networkInfo = ref.read(networkInfoImplementerProvider);
  return RepositoryImplementer(
    remoteDataSource: remoteDataSource,
    networkInfo: networkInfo,
  );
}
