import 'package:shop_app_mvvm/app/firebase_options.dart';

class Constants {
  static String baseUrl(String operationType) =>
      'https://identitytoolkit.googleapis.com/v1/accounts:$operationType?key=${FirebaseKeys.apiKey}';
}
