// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/domain/model/models.dart';
import 'package:shop_app_mvvm/presentation/resources/color_manger.dart';
import 'package:shop_app_mvvm/presentation/resources/values_manager.dart';

class BannerItemWidget extends StatelessWidget {
  const BannerItemWidget({
    Key? key,
    required this.banner,
  }) : super(key: key);
  final BannerAd banner;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: AppSize.s1_5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
            side: BorderSide(color: ColorManager.primary, width: AppSize.s1)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s12),
          child: Image.network(banner.image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
