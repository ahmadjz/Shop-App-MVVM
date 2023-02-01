import 'package:shop_app_mvvm/app/constants.dart';
import 'package:shop_app_mvvm/app/extensions.dart';
import 'package:shop_app_mvvm/data/response/responses.dart';
import 'package:shop_app_mvvm/domain/model/models.dart';

extension CustomerResponseMapper on CustomerResponse? {
  // from data layer to domain layer
  Customer toDomain() {
    return Customer(
      id: this?.id.orZero() ?? Constants.zero,
      numOfNotification: this?.numOfNotification.orZero() ?? Constants.zero,
      name: this?.name.orEmpty() ?? Constants.empty,
    );
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  // from data layer to domain layer
  Contacts toDomain() {
    return Contacts(
      email: this?.email.orEmpty() ?? Constants.empty,
      link: this?.link.orEmpty() ?? Constants.empty,
      phone: this?.phone.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  // from data layer to domain layer
  Authentication toDomain() {
    return Authentication(
      contactsResponse: this?.contactsResponse.toDomain(),
      customerResponse: this?.customerResponse.toDomain(),
    );
  }
}
