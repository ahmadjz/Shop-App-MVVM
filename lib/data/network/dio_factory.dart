import 'package:dio/dio.dart';
import 'package:shop_app_mvvm/app/constants.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String authorization = "authorization";
const String defaultLanguage = "language";

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();

    int timeOut = 60 * 1000; // a min time out
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: "SEND TOKEN HERE",
      defaultLanguage: "en" // todo get lang from app prefs
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseURL,
        headers: headers,
        receiveTimeout: timeOut,
        sendTimeout: timeOut);

    return dio;
  }
}
