// ignore_for_file: public_member_api_docs, sort_constructors_first
// onBoarding Models

class SliderObject {
  String title;
  String subTitle;
  String image;
  SliderObject({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

class SliderViewObject {
  SliderObject sliderObject;
  int numberOfSlides;
  int currentIndex;
  SliderViewObject({
    required this.sliderObject,
    required this.numberOfSlides,
    required this.currentIndex,
  });
}

// login models

class Customer {
  int id;
  int numOfNotification;
  String name;
  Customer({
    required this.id,
    required this.numOfNotification,
    required this.name,
  });
}

class Contacts {
  String phone;
  String email;
  String link;
  Contacts({
    required this.phone,
    required this.email,
    required this.link,
  });
}

class Authentication {
  Customer? customerResponse;
  Contacts? contactsResponse;
  Authentication({
    required this.customerResponse,
    required this.contactsResponse,
  });
}

class ForgotPasswordData {
  final String supportMessage;
  ForgotPasswordData({
    required this.supportMessage,
  });
}

class Service {
  final int id;
  final String title;
  final String image;
  Service({
    required this.id,
    required this.title,
    required this.image,
  });
}

class Store {
  final int id;
  final String title;
  final String image;
  Store({
    required this.id,
    required this.title,
    required this.image,
  });
}

class BannerAd {
  final int id;
  final String title;
  final String link;
  final String image;
  BannerAd({
    required this.link,
    required this.id,
    required this.title,
    required this.image,
  });
}

class HomeData {
  List<Service> services;
  List<BannerAd> banners;
  List<Store> stores;
  HomeData({
    required this.services,
    required this.banners,
    required this.stores,
  });
}

class HomeObject {
  HomeData data;
  HomeObject({
    required this.data,
  });
}

class StoreDetails {
  int id;
  String title;
  String image;
  String details;
  String services;
  String about;

  StoreDetails(
      this.id, this.title, this.image, this.details, this.services, this.about);
}
