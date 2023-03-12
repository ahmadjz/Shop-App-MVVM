import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shop_app_mvvm/app/constants.dart';
import 'package:shop_app_mvvm/data/response/responses.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseURL)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("customers/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST("customers/forgotPassword")
  Future<ForgotPasswordResponse> forgotPassword(
    @Field("email") String email,
  );

  @POST("customers/register")
  Future<AuthenticationResponse> register({
    @Field("email") required String email,
    @Field("password") required String password,
    @Field("user_name") required String userName,
    @Field("country_mobile_code") required String countryMobileCode,
    @Field("mobile_number") required String mobileNumber,
    @Field("profile_picture") required String profilePicture,
  });

  @GET("home")
  Future<HomeResponse> getHome();
}
