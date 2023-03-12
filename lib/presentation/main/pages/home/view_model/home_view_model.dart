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
  final StreamController _homeDataStreamController =
      BehaviorSubject<HomeData>();

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
      inputHomeData.add(homeObject.data);

      // navigate to main screen
    });
  }

  @override
  void dispose() {
    _homeDataStreamController.close();

    super.dispose();
  }

  @override
  Sink get inputHomeData => _homeDataStreamController.sink;

  @override
  Stream<HomeData> get outputHomeData =>
      _homeDataStreamController.stream.map((data) => data);
}

abstract class HomeViewModelInput {
  Sink get inputHomeData;
}

abstract class HomeViewModelOutput {
  Stream<HomeData> get outputHomeData;
}
