import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/feature/store/data/models/product_model.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/oder_vertical_list_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/view_pickup_order_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../data/models/order_model.dart';
import '../../../data/models/store_category_model.dart';
import '../../../data/models/store_model.dart';

class InProgressOrderTabView extends StatelessWidget {
  const InProgressOrderTabView({super.key});

  @override
  Widget build(BuildContext context) {
    OrderModel orderModel = OrderModel(
        number: '86662', orderType: 'Pik up',
        storeModel: StoreModel(
          products: [],
          storeIamge: 'https://img.freepik.com/free-vector/coffee-cup-tan-colour_78370-3051.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1722643200&semt=sph',
          storeName: 'Coffee',
          storeCategory: StoreCategoryModel(
            categoryImage: '',
            categoryName: '',
          ),
        ),
        products: [],
        amount: 20.0);
    return OrdersVerticalListView(
      hideProgress: true,
      detailsTap: () {
        PersistentNavBarNavigator.pushNewScreen(context,
            screen: ViewPickupOrderView(
              product: ProductModel(
                  productName: 'Coffee',
                  productImage: AssetsData.cafeImage),
            ));
      },
      reorderTap: () {}, orderModel: orderModel,
    );
  }
}
