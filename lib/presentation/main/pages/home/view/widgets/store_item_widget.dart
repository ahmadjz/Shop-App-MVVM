// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/domain/model/models.dart';
import 'package:shop_app_mvvm/presentation/resources/routes_manager.dart';
import 'package:shop_app_mvvm/presentation/resources/values_manager.dart';

class StoreItemWidget extends StatelessWidget {
  const StoreItemWidget({
    Key? key,
    required this.store,
  }) : super(key: key);
  final Store store;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.storeDetailsRoute);
      },
      child: Card(
        elevation: AppSize.s4,
        child: Image.network(
          store.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
