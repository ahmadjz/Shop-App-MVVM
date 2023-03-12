import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app_mvvm/app/providers/my_app_modules.dart';
import 'package:shop_app_mvvm/domain/model/models.dart';
import 'package:shop_app_mvvm/presentation/common/state_renderer/state_renderer_implementer.dart';
import 'package:shop_app_mvvm/presentation/main/pages/home/view/widgets/build_banners_section.dart';
import 'package:shop_app_mvvm/presentation/main/pages/home/view/widgets/build_services_section.dart';
import 'package:shop_app_mvvm/presentation/main/pages/home/view/widgets/build_stores_section.dart';
import 'package:shop_app_mvvm/presentation/main/pages/home/view_model/home_view_model.dart';
import 'package:shop_app_mvvm/presentation/resources/strings_manager.dart';
import 'package:shop_app_mvvm/presentation/resources/values_manager.dart';

class HomePageView extends ConsumerStatefulWidget {
  const HomePageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePageView> {
  late HomeViewModel _homeViewModel;
  _bind() {
    _homeViewModel = HomeViewModel(
      ref.read(myAppModulesProvider).initHomeUseCase(),
    );
    _homeViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _homeViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: StreamBuilder<FlowState>(
            stream: _homeViewModel.outputState,
            builder: (context, snapshot) {
              return snapshot.data?.getScreenWidget(
                      context: context,
                      contentScreenWidget: _getContentWidget(),
                      retryActionFunction: () {
                        _homeViewModel.start();
                      }) ??
                  _getContentWidget();
            }),
      ),
    );
  }

  Widget _getContentWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getBannersCarousel(),
        _getSection(AppStrings.services),
        _getServices(),
        _getSection(AppStrings.stores),
        _getStores()
      ],
    );
  }

  Widget _getSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppPadding.p12,
          left: AppPadding.p12,
          right: AppPadding.p12,
          bottom: AppPadding.p2),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }

  Widget _getBannersCarousel() {
    return StreamBuilder<List<BannerAd>>(
        stream: _homeViewModel.outputBanners,
        builder: (context, snapshot) {
          return BuildBannersSection(
            banners: snapshot.data,
          );
        });
  }

  Widget _getServices() {
    return StreamBuilder<List<Service>>(
        stream: _homeViewModel.outputServices,
        builder: (context, snapshot) {
          return BuildServicesSection(services: snapshot.data);
        });
  }

  Widget _getStores() {
    return StreamBuilder<List<Store>>(
        stream: _homeViewModel.outputStores,
        builder: (context, snapshot) {
          return BuildStoresSection(stores: snapshot.data);
        });
  }
}
