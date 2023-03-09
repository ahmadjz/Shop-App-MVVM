import 'package:dartz/dartz.dart';
import 'package:shop_app_mvvm/data/network/failure.dart';
import 'package:shop_app_mvvm/data/network/requests.dart';
import 'package:shop_app_mvvm/domain/model/models.dart';
import 'package:shop_app_mvvm/domain/repository/repository.dart';
import 'package:shop_app_mvvm/domain/use_case/base_use_case.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, Authentication> {
  final Repository _repository;
  RegisterUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, Authentication>> execute(
      RegisterUseCaseInput input) async {
    return await _repository.register(
      RegisterRequest(
        countryMobileCode: input.countryMobileCode,
        email: input.email,
        mobileNumber: input.mobileNumber,
        password: input.password,
        profilePicture: input.profilePicture,
        userName: input.userName,
      ),
    );
  }
}

class RegisterUseCaseInput {
  String email;
  String password;
  String profilePicture;
  String mobileNumber;
  String countryMobileCode;
  String userName;
  RegisterUseCaseInput({
    required this.email,
    required this.password,
    required this.profilePicture,
    required this.mobileNumber,
    required this.countryMobileCode,
    required this.userName,
  });
}
