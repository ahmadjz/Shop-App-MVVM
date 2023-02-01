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
