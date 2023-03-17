import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app_mvvm/app/providers/my_app_modules.dart';
import 'package:shop_app_mvvm/domain/model/models.dart';
import 'package:shop_app_mvvm/presentation/common/state_renderer/state_renderer_implementer.dart';
import 'package:shop_app_mvvm/presentation/resources/color_manger.dart';
import 'package:shop_app_mvvm/presentation/resources/strings_manager.dart';
import 'package:shop_app_mvvm/presentation/resources/values_manager.dart';
import 'package:shop_app_mvvm/presentation/store_details/view_model/store_details_view_model.dart';

class StoreDetailsView extends ConsumerStatefulWidget {
  const StoreDetailsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StoreDetailsViewState();
}

class _StoreDetailsViewState extends ConsumerState<StoreDetailsView> {
  late StoreDetailsViewModel _storeDetailsViewModel;

  @override
  void initState() {
    bind();
    super.initState();
  }

  bind() {
    _storeDetailsViewModel = StoreDetailsViewModel(
      storeDetailsUseCase:
          ref.read(myAppModulesProvider).initStoreDetailsUseCase(),
    );
    _storeDetailsViewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<FlowState>(
      stream: _storeDetailsViewModel.outputState,
      builder: (context, snapshot) {
        return Container(
          child: snapshot.data?.getScreenWidget(
                  context: context,
                  retryActionFunction: () {
                    _storeDetailsViewModel.start();
                  },
                  contentScreenWidget: _getContentWidget()) ??
              Container(),
        );
      },
    ));
  }

  Widget _getContentWidget() {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          title: const Text(AppStrings.storeDetails),
          elevation: AppSize.s0,
          iconTheme: IconThemeData(
            //back button
            color: ColorManager.white,
          ),
          backgroundColor: ColorManager.primary,
          centerTitle: true,
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          color: ColorManager.white,
          child: SingleChildScrollView(
            child: StreamBuilder<StoreDetails>(
              stream: _storeDetailsViewModel.outputStoreDetails,
              builder: (context, snapshot) {
                return _getItems(snapshot.data);
              },
            ),
          ),
        ));
  }

  Widget _getItems(StoreDetails? storeDetails) {
    if (storeDetails != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Image.network(
            storeDetails.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250,
          )),
          _getSection(AppStrings.details),
          _getInfoText(storeDetails.details),
          _getSection(AppStrings.services),
          _getInfoText(storeDetails.services),
          _getSection(AppStrings.about),
          _getInfoText(storeDetails.about)
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _getSection(String title) {
    return Padding(
        padding: const EdgeInsets.only(
            top: AppPadding.p12,
            left: AppPadding.p12,
            right: AppPadding.p12,
            bottom: AppPadding.p2),
        child: Text(title, style: Theme.of(context).textTheme.titleMedium));
  }

  Widget _getInfoText(String info) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s12),
      child: Text(info, style: Theme.of(context).textTheme.bodySmall),
    );
  }

  @override
  void dispose() {
    _storeDetailsViewModel.dispose();
    super.dispose();
  }
}
