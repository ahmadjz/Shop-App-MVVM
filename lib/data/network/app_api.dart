import 'package:dio/dio.dart';
import 'package:shop_app_mvvm/app/constants.dart';
import 'package:shop_app_mvvm/app/firebase_operations.dart';
import 'package:shop_app_mvvm/data/response/responses.dart';

class AppServiceClient {
  Future<AuthenticationResponse> login(
    String email,
    String password,
  ) async {
    final response =
        await Dio().post(Constants.baseUrl(FirebaseOperations.signUp), data: {
      "email": email,
      "password": password,
    });
    if (response.data == null) {
      throw "Connection error";
    }
    final value = AuthenticationResponse.fromMap(response.data);
    return value;
  }
}
