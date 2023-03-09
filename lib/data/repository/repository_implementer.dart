// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:shop_app_mvvm/data/data_source/remote_data_source.dart';
import 'package:shop_app_mvvm/data/mapper/mapper.dart';
import 'package:shop_app_mvvm/data/network/error_handler.dart';
import 'package:shop_app_mvvm/data/network/failure.dart';
import 'package:shop_app_mvvm/data/network/network_info.dart';
import 'package:shop_app_mvvm/data/network/requests.dart';
import 'package:shop_app_mvvm/domain/model/models.dart';
import 'package:shop_app_mvvm/domain/repository/repository.dart';

class RepositoryImplementer implements Repository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  RepositoryImplementer({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.login(
          loginRequest,
        );
        if (response.status == ApiInternalStatus.success) {
          return Right(
            response.toDomain(),
          );
        } else {
          return Left(
            Failure(
              code: ApiInternalStatus.failure,
              message: response.message ?? "business error",
            ),
          );
        }
      } catch (error) {
        return Left(
          ErrorHandler.handle(error).failure,
        );
      }
    } else {
      return Left(
        DataSource.noInternetConnection.getFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, ForgotPasswordData>> forgotPassword(
    ForgotPasswordRequest forgotPasswordRequest,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.forgotPassword(
          forgotPasswordRequest,
        );
        if (response.status == ApiInternalStatus.success) {
          return Right(
            response.toDomain(),
          );
        } else {
          return Left(
            Failure(
              code: ApiInternalStatus.failure,
              message: response.message ?? "business error",
            ),
          );
        }
      } catch (error) {
        return Left(
          ErrorHandler.handle(error).failure,
        );
      }
    } else {
      return Left(
        DataSource.noInternetConnection.getFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.register(
          registerRequest,
        );
        if (response.status == ApiInternalStatus.success) {
          return Right(
            response.toDomain(),
          );
        } else {
          return Left(
            Failure(
              code: ApiInternalStatus.failure,
              message: response.message ?? "business error",
            ),
          );
        }
      } catch (error) {
        return Left(
          ErrorHandler.handle(error).failure,
        );
      }
    } else {
      return Left(
        DataSource.noInternetConnection.getFailure(),
      );
    }
  }
}
