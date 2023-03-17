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

extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  // from data layer to domain layer
  ForgotPasswordData toDomain() {
    return ForgotPasswordData(
        supportMessage: this?.supportMessage ?? Constants.empty);
  }
}

extension ServiceResponseMapper on ServiceResponse? {
  Service toDomain() {
    return Service(
        id: this?.id?.orZero() ?? Constants.zero,
        title: this?.title?.orEmpty() ?? Constants.empty,
        image: this?.image?.orEmpty() ?? Constants.empty);
  }
}

extension StoreResponseMapper on StoreResponse? {
  Store toDomain() {
    return Store(
        id: this?.id?.orZero() ?? Constants.zero,
        title: this?.title?.orEmpty() ?? Constants.empty,
        image: this?.image?.orEmpty() ?? Constants.empty);
  }
}

extension BannerResponseMapper on BannerResponse? {
  BannerAd toDomain() {
    return BannerAd(
        link: this?.link?.orEmpty() ?? Constants.empty,
        id: this?.id?.orZero() ?? Constants.zero,
        title: this?.title?.orEmpty() ?? Constants.empty,
        image: this?.image?.orEmpty() ?? Constants.empty);
  }
}

extension HomeResponseMapper on HomeResponse? {
  // from data layer to domain layer
  HomeObject toDomain() {
    List<Service> services = (this
                ?.data
                ?.services
                ?.map((serviceResponse) => serviceResponse.toDomain()) ??
            const Iterable.empty().cast<Service>())
        .toList();
    List<Store> stores = (this
                ?.data
                ?.stores
                ?.map((storesResponse) => storesResponse.toDomain()) ??
            const Iterable.empty().cast<Store>())
        .toList();
    List<BannerAd> banners = (this
                ?.data
                ?.banners
                ?.map((bannersResponse) => bannersResponse.toDomain()) ??
            const Iterable.empty().cast<BannerAd>())
        .toList();
    return HomeObject(
      data: HomeData(
        services: services,
        banners: banners,
        stores: stores,
      ),
    );
  }
}

extension StoreDetailsResponseMapper on StoreDetailsResponse? {
  StoreDetails toDomain() {
    return StoreDetails(
        this?.id?.orZero() ?? Constants.zero,
        this?.title?.orEmpty() ?? Constants.empty,
        this?.image?.orEmpty() ?? Constants.empty,
        this?.details?.orEmpty() ?? Constants.empty,
        this?.services?.orEmpty() ?? Constants.empty,
        this?.about?.orEmpty() ?? Constants.empty);
  }
}
