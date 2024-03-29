// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shop_app_mvvm/data/network/app_api.dart';
import 'package:shop_app_mvvm/data/network/requests.dart';
import 'package:shop_app_mvvm/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<AuthenticationResponse> register(RegisterRequest registerRequest);
  Future<ForgotPasswordResponse> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest);
  Future<HomeResponse> getHomeData();
  Future<StoreDetailsResponse> getStoreDetails();
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImplementer(
    this._appServiceClient,
  );

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest) async {
    return await _appServiceClient.forgotPassword(forgotPasswordRequest.email);
  }

  @override
  Future<AuthenticationResponse> register(
      RegisterRequest registerRequest) async {
    return await _appServiceClient.register(
      email: registerRequest.email,
      countryMobileCode: registerRequest.countryMobileCode,
      mobileNumber: registerRequest.mobileNumber,
      password: registerRequest.password,
      profilePicture: registerRequest.profilePicture,
      userName: registerRequest.userName,
    );
  }

  @override
  Future<HomeResponse> getHomeData() async {
    return _appServiceClient.getHome();
  }

  @override
  Future<StoreDetailsResponse> getStoreDetails() async {
    return await _appServiceClient.getStoreDetails();
  }
}
