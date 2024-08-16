import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/oder_vertical_list_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/view_pickup_order_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../data/models/order_model.dart';
import '../../../data/models/store_model.dart';

class InProgressOrderTabView extends StatelessWidget {
  const InProgressOrderTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return OrdersVerticalListView(
      hideProgress: true,
      detailsTap: () {
       /* PersistentNavBarNavigator.pushNewScreen(context,
            screen: ViewPickupOrderView(
              product: ProductModel(
                  productName: 'Coffee',
                  productImage: AssetsData.cafeImage),
            ));*/
      },
      reorderTap: () {},
    );
  }
}
