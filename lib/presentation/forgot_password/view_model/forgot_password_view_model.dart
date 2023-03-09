import 'dart:async';

import 'package:shop_app_mvvm/app/functions.dart';
import 'package:shop_app_mvvm/domain/use_case/forgot_password_use_case.dart';
import 'package:shop_app_mvvm/presentation/base/base_view_model.dart';
import 'package:shop_app_mvvm/presentation/common/freezed_data_classes.dart';
import 'package:shop_app_mvvm/presentation/common/state_renderer/state_renderer.dart';
import 'package:shop_app_mvvm/presentation/common/state_renderer/state_renderer_implementer.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with ForgotPasswordModelInputs, ForgotPasswordModelOutputs {
  ForgotPasswordViewModel(this._forgotPasswordUseCase);
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final StreamController<String> _emailStreamController =
      StreamController<String>.broadcast();
  ForgotPasswordObject forgotPasswordObject = ForgotPasswordObject("");

  @override
  void dispose() {
    super.dispose();
    _emailStreamController.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  setEmail(String email) {
    inputEmail.add(email);
    forgotPasswordObject = forgotPasswordObject.copyWith(email: email);
  }

  @override
  forgotPassword() async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.popupLoadingState,
      ),
    );
    (await _forgotPasswordUseCase.execute(
      ForgotPasswordUseCaseInput(
        email: forgotPasswordObject.email,
      ),
    ))
        .fold(
      (failure) => inputState.add(
        ErrorState(
            stateRendererType: StateRendererType.popupErrorState,
            message: failure.message),
      ),
      (data) => {
        inputState.add(
          SuccessState(
              stateRendererType: StateRendererType.popupSuccessState,
              message: data.supportMessage),
        ),
      },
    );
  }

  @override
  Stream<bool> get outIsEmailValid =>
      _emailStreamController.stream.map(isEmailValid);
}

abstract class ForgotPasswordModelInputs {
  setEmail(String email);
  forgotPassword();
  Sink get inputEmail;
}

abstract class ForgotPasswordModelOutputs {
  Stream<bool> get outIsEmailValid;
}
