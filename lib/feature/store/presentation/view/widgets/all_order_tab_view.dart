import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/feature/store/data/models/product_model.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/oder_vertical_list_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/view_order_details.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class AllOrderTabView extends StatelessWidget {
  const AllOrderTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return OrdersVerticalListView(
      hideProgress: false,
      detailsTap: () {
        PersistentNavBarNavigator.pushNewScreen(context,
            screen: ViewOrderDetails(
              product: ProductModel(
                  productName: 'Bari alqaws stud',
                  productImage: AssetsData.store2),
            ));
      },
      reorderTap: () {},
    );
  }
}
