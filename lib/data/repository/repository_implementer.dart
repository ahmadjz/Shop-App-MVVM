// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:shop_app_mvvm/data/data_source/local_data_source.dart';
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
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  RepositoryImplementer({
    required this.remoteDataSource,
    required this.localDataSource,
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

  @override
  Future<Either<Failure, HomeObject>> getHomeData() async {
    try {
      final response = await localDataSource.getHomeData();
      return Right(
        response.toDomain(),
      );
    } catch (cacheError) {
      if (await networkInfo.isConnected) {
        try {
          final response = await remoteDataSource.getHomeData();
          if (response.status == ApiInternalStatus.success) {
            localDataSource.saveHomeToCache(response);
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

  @override
  Future<Either<Failure, StoreDetails>> getStoreDetails() async {
    try {
      // get data from cache

      final response = await localDataSource.getStoreDetails();
      return Right(response.toDomain());
    } catch (cacheError) {
      if (await networkInfo.isConnected) {
        try {
          final response = await remoteDataSource.getStoreDetails();
          if (response.status == ApiInternalStatus.success) {
            localDataSource.saveStoreDetailsToCache(response);
            return Right(response.toDomain());
          } else {
            return Left(Failure(
                message: response.message ?? ResponseMessage.defaultError,
                code: response.status ?? ResponseCode.defaultError));
          }
        } catch (error) {
          return Left(ErrorHandler.handle(error).failure);
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    }
  }
}
