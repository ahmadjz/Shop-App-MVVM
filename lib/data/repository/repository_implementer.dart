// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:shop_app_mvvm/data/data_source/remote_data_source.dart';
import 'package:shop_app_mvvm/data/mapper/mapper.dart';
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
      final response = await remoteDataSource.login(loginRequest);

      if (response.status == 0) {
        return Right(response.toDomain());
      } else {
        return Left(
          Failure(
            code: 409,
            message: response.message ?? "business error",
          ),
        );
      }
    } else {
      return Left(
        Failure(
          code: 501,
          message: "please check your internet connection",
        ),
      );
    }
  }
}
