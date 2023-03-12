import 'package:flutter/material.dart';
import 'package:shop_app_mvvm/domain/model/models.dart';
import 'package:shop_app_mvvm/presentation/main/pages/home/view/widgets/store_item_widget.dart';
import 'package:shop_app_mvvm/presentation/resources/values_manager.dart';

class BuildStoresSection extends StatelessWidget {
  const BuildStoresSection({
    Key? key,
    required this.stores,
  }) : super(key: key);
  final List<Store>? stores;
  @override
  Widget build(BuildContext context) {
    if (stores != null) {
      return Padding(
        padding: const EdgeInsets.only(
            left: AppPadding.p12, right: AppPadding.p12, top: AppPadding.p12),
        child: Flex(
          direction: Axis.vertical,
          children: [
            GridView.count(
              crossAxisCount: AppSize.s2,
              crossAxisSpacing: AppSize.s8,
              mainAxisSpacing: AppSize.s8,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                stores!.length,
                (index) {
                  return StoreItemWidget(store: stores![index]);
                },
              ),
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
