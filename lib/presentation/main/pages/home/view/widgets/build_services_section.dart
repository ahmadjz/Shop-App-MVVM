// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/domain/model/models.dart';
import 'package:shop_app_mvvm/presentation/main/pages/home/view/widgets/service_item_widget.dart';
import 'package:shop_app_mvvm/presentation/resources/values_manager.dart';

class BuildServicesSection extends StatelessWidget {
  const BuildServicesSection({
    Key? key,
    required this.services,
  }) : super(key: key);
  final List<Service>? services;
  @override
  Widget build(BuildContext context) {
    if (services != null) {
      return Padding(
        padding:
            const EdgeInsets.only(left: AppPadding.p12, right: AppPadding.p12),
        child: Container(
          height: AppSize.s160,
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: services!
                .map((service) => ServiceItemWidget(service: service))
                .toList(),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
