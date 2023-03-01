import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app_mvvm/app/providers/my_app_modules.dart';
import 'package:shop_app_mvvm/presentation/common/state_renderer/state_renderer_implementer.dart';
import 'package:shop_app_mvvm/presentation/forgot_password/view_model/forgot_password_view_model.dart';
import 'package:shop_app_mvvm/presentation/resources/assets_manager.dart';
import 'package:shop_app_mvvm/presentation/resources/color_manger.dart';
import 'package:shop_app_mvvm/presentation/resources/strings_manager.dart';
import 'package:shop_app_mvvm/presentation/resources/values_manager.dart';

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPasswordView> {
  late ForgotPasswordViewModel _forgotPasswordViewModel;
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _forgotPasswordViewModel = ForgotPasswordViewModel(
      ref.read(myAppModulesProvider).initForgotPasswordUseCase(),
    );
    _forgotPasswordViewModel.start();
    _emailController.addListener(
        () => _forgotPasswordViewModel.setEmail(_emailController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _forgotPasswordViewModel.dispose();
    super.dispose();
  }

  Widget _getContentWidget() {
    return Container(
      padding: const EdgeInsetsDirectional.only(top: AppPadding.p100),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Center(
                  child: Image(image: AssetImage(ImageAssets.splashLogo))),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: AppPadding.p28, end: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _forgotPasswordViewModel.outIsEmailValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: AppStrings.email,
                          labelText: AppStrings.email,
                          errorText: (snapshot.data ?? true)
                              ? null
                              : AppStrings.emailError),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: AppPadding.p28, end: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _forgotPasswordViewModel.outIsEmailValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? () {
                                  _forgotPasswordViewModel.forgotPassword();
                                }
                              : null,
                          child: const Text(AppStrings.forgotPassword)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: StreamBuilder<FlowState>(
        stream: _forgotPasswordViewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(
                  context: context,
                  contentScreenWidget: _getContentWidget(),
                  retryActionFunction: () {}) ??
              _getContentWidget();
        },
      ),
    );
  }
}
