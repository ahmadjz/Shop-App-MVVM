import 'package:dartz/dartz.dart';
import 'package:shop_app_mvvm/data/network/failure.dart';
import 'package:shop_app_mvvm/data/network/requests.dart';
import 'package:shop_app_mvvm/domain/model/models.dart';
import 'package:shop_app_mvvm/domain/repository/repository.dart';
import 'package:shop_app_mvvm/domain/use_case/base_use_case.dart';

class ForgotPasswordUseCase
    implements BaseUseCase<ForgotPasswordUseCaseInput, ForgotPasswordData> {
  final Repository _repository;
  ForgotPasswordUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, ForgotPasswordData>> execute(
      ForgotPasswordUseCaseInput input) async {
    return await _repository.forgotPassword(
      ForgotPasswordRequest(email: input.email),
    );
  }
}

class ForgotPasswordUseCaseInput {
  String email;
  ForgotPasswordUseCaseInput({
    required this.email,
  });
}
