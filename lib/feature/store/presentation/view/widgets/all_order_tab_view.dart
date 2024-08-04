import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/feature/store/data/models/order_model.dart';
import 'package:UQPay/feature/store/data/models/product_model.dart';
import 'package:UQPay/feature/store/data/models/store_category_model.dart';
import 'package:UQPay/feature/store/data/models/store_model.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/oder_vertical_list_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/view_order_details.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class AllOrderTabView extends StatelessWidget {
  const AllOrderTabView({super.key});

  @override
  Widget build(BuildContext context) {
    OrderModel orderModel = OrderModel(
        number: '86362', orderType: 'Subscription',
        storeModel: StoreModel( 
          products: [],
          storeIamge: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsmclv_H61WP7SHs4yMz0WIR2QLxqRnRnmOw&s',
        storeName: 'Fitness gym',
          storeCategory: StoreCategoryModel(
            categoryImage: '',
            categoryName: '',
          ),
        ), 
        products: [], 
        amount: 200.0);
    
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
      reorderTap: () {}, orderModel: orderModel,
    );
  }
}
