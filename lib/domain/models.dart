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

class Authentication {
  String id;
  String email;
  int numOfNotification;
  Authentication({
    required this.id,
    required this.email,
    required this.numOfNotification,
  });
}
