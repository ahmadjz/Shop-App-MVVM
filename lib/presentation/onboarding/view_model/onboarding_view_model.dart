import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:shop_app_mvvm/domain/model/models.dart';
import 'package:shop_app_mvvm/presentation/base/base_view_model.dart';
import 'package:shop_app_mvvm/presentation/resources/assets_manager.dart';
import 'package:shop_app_mvvm/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goToNextSlide() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goToPreviousSlide() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChange(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  List<SliderObject> _getSliderData() => [
        SliderObject(
          image: ImageAssets.onboardingLogo1,
          subTitle: AppStrings.onBoardingSubTitle1.tr(),
          title: AppStrings.onBoardingTitle1.tr(),
        ),
        SliderObject(
          image: ImageAssets.onboardingLogo2,
          subTitle: AppStrings.onBoardingSubTitle2.tr(),
          title: AppStrings.onBoardingTitle2.tr(),
        ),
        SliderObject(
          image: ImageAssets.onboardingLogo3,
          subTitle: AppStrings.onBoardingSubTitle3.tr(),
          title: AppStrings.onBoardingTitle3.tr(),
        ),
        SliderObject(
          image: ImageAssets.onboardingLogo3,
          subTitle: AppStrings.onBoardingSubTitle3.tr(),
          title: AppStrings.onBoardingTitle3.tr(),
        ),
      ];

  void _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(
        sliderObject: _list[_currentIndex],
        numberOfSlides: _list.length,
        currentIndex: _currentIndex));
  }
}

abstract class OnBoardingViewModelInputs {
  int goToNextSlide();
  int goToPreviousSlide();
  void onPageChange(int index);

  // stream controller input
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
