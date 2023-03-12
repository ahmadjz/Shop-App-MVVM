// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:shop_app_mvvm/domain/model/models.dart';
import 'package:shop_app_mvvm/domain/use_case/home_use_case.dart';
import 'package:shop_app_mvvm/presentation/base/base_view_model.dart';
import 'package:shop_app_mvvm/presentation/common/state_renderer/state_renderer.dart';
import 'package:shop_app_mvvm/presentation/common/state_renderer/state_renderer_implementer.dart';

class HomeViewModel extends BaseViewModel
    with HomeViewModelInput, HomeViewModelOutput {
  final HomeUseCase _homeUseCase;
  HomeViewModel(
    this._homeUseCase,
  );
  final StreamController _bannersStreamController =
      BehaviorSubject<List<BannerAd>>();
  final StreamController _servicesStreamController =
      BehaviorSubject<List<Service>>();
  final StreamController _storesStreamController =
      BehaviorSubject<List<Store>>();

  @override
  void start() {
    _getHomeData();
  }

  _getHomeData() async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState,
      ),
    );
    (await _homeUseCase.execute(null)).fold(
        (failure) => {
              // left -> failure
              inputState.add(
                ErrorState(
                    stateRendererType: StateRendererType.fullScreenErrorState,
                    message: failure.message),
              )
            }, (homeObject) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
      inputBanners.add(homeObject.data?.banners);
      inputServices.add(homeObject.data?.services);
      inputStores.add(homeObject.data?.stores);
      // navigate to main screen
    });
  }

  @override
  void dispose() {
    _bannersStreamController.close();
    _servicesStreamController.close();
    _storesStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputBanners => _bannersStreamController.sink;

  @override
  Sink get inputServices => _servicesStreamController.sink;

  @override
  Sink get inputStores => _storesStreamController.sink;

  @override
  Stream<List<BannerAd>> get outputBanners =>
      _bannersStreamController.stream.map((banners) => banners);

  @override
  Stream<List<Service>> get outputServices =>
      _servicesStreamController.stream.map((services) => services);

  @override
  Stream<List<Store>> get outputStores =>
      _storesStreamController.stream.map((stores) => stores);
}

abstract class HomeViewModelInput {
  Sink get inputStores;

  Sink get inputServices;

  Sink get inputBanners;
}

abstract class HomeViewModelOutput {
  Stream<List<Store>> get outputStores;

  Stream<List<Service>> get outputServices;

  Stream<List<BannerAd>> get outputBanners;
}
