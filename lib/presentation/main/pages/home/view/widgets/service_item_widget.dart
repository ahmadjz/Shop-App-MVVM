// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/domain/model/models.dart';
import 'package:shop_app_mvvm/presentation/resources/color_manger.dart';
import 'package:shop_app_mvvm/presentation/resources/values_manager.dart';

class ServiceItemWidget extends StatelessWidget {
  const ServiceItemWidget({
    Key? key,
    required this.service,
  }) : super(key: key);
  final Service service;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSize.s4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
          side: BorderSide(color: ColorManager.white, width: AppSize.s1)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s12),
            child: Image.network(
              service.image,
              fit: BoxFit.cover,
              width: AppSize.s120,
              height: AppSize.s120,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: AppPadding.p8),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  service.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ))
        ],
      ),
    );
  }
}
