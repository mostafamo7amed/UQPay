
import 'package:UQPay/feature/store/presentation/view/widgets/oder_vertical_list_view.dart';
import 'package:flutter/material.dart';


class AllOrderTabView extends StatelessWidget {
  const AllOrderTabView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return OrdersVerticalListView(
      hideProgress: false,
      detailsTap: () {
      /*  PersistentNavBarNavigator.pushNewScreen(context,
            screen: ViewOrderDetails(
              product: ProductModel(: 'Bari alqaws stud',
              productImage: AssetsData.store2),
            ));*/
      },
      reorderTap: () {},
    );
  }
}
