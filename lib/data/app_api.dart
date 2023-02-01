import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shop_app_mvvm/app/constants.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseURL)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
}
