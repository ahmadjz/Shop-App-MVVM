import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/domain/model/models.dart';
import 'package:shop_app_mvvm/presentation/main/pages/home/view/widgets/banner_item_widget.dart';
import 'package:shop_app_mvvm/presentation/resources/values_manager.dart';

class BuildBannersSection extends StatelessWidget {
  const BuildBannersSection({
    Key? key,
    required this.banners,
  }) : super(key: key);
  final List<BannerAd>? banners;
  @override
  Widget build(BuildContext context) {
    if (banners != null) {
      return CarouselSlider(
          items: banners!
              .map((banner) => BannerItemWidget(banner: banner))
              .toList(),
          options: CarouselOptions(
              height: AppSize.s190,
              autoPlay: true,
              enableInfiniteScroll: true,
              enlargeCenterPage: true));
    } else {
      return Container();
    }
  }
}
