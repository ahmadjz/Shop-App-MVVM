import 'package:dartz/dartz.dart';
import 'package:shop_app_mvvm/data/network/failure.dart';
import 'package:shop_app_mvvm/data/network/requests.dart';
import 'package:shop_app_mvvm/domain/model/models.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, ForgotPasswordData>> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest);
  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest);
  Future<Either<Failure, HomeObject>> getHomeData();
}
