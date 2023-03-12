import 'package:dartz/dartz.dart';
import 'package:shop_app_mvvm/data/network/failure.dart';
import 'package:shop_app_mvvm/domain/model/models.dart';
import 'package:shop_app_mvvm/domain/repository/repository.dart';
import 'package:shop_app_mvvm/domain/use_case/base_use_case.dart';

class HomeUseCase implements BaseUseCase<void, HomeObject> {
  final Repository _repository;
  HomeUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, HomeObject>> execute(Null) async {
    return await _repository.getHomeData();
  }
}
