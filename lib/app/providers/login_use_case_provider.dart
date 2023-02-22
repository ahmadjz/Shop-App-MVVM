import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_app_mvvm/app/providers/repository_implementer_provider.dart';
import 'package:shop_app_mvvm/domain/use_case/login_use_case.dart';

part 'login_use_case_provider.g.dart';

@riverpod
Future<LoginUseCase> loginUseCase(LoginUseCaseRef ref) async {
  return LoginUseCase(
    await ref.read(
      repositoryImplementerProvider.future,
    ),
  );
}
