// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginRequest {
  String email;
  String password;
  LoginRequest({
    required this.email,
    required this.password,
  });
}

class ForgotPasswordRequest {
  final String email;
  ForgotPasswordRequest({
    required this.email,
  });
}

class RegisterRequest {
  String email;
  String password;
  String profilePicture;
  String mobileNumber;
  String countryMobileCode;
  String userName;
  RegisterRequest({
    required this.email,
    required this.password,
    required this.profilePicture,
    required this.mobileNumber,
    required this.countryMobileCode,
    required this.userName,
  });
}
