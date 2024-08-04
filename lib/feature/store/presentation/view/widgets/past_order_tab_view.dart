import 'package:UQPay/feature/store/presentation/view/widgets/oder_vertical_list_view.dart';
import 'package:flutter/material.dart';

import '../../../data/models/order_model.dart';
import '../../../data/models/store_category_model.dart';
import '../../../data/models/store_model.dart';

class PastOrderTabView extends StatelessWidget {
  const PastOrderTabView({super.key});

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
      detailsTap: () {},
      reorderTap: () {},
      orderModel: orderModel,
    );
  }
}
