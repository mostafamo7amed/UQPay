import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/feature/store/data/models/product_model.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/make_order_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class StoreDetailsView extends StatelessWidget {
  StoreDetailsView(
      {super.key, required this.products, required this.storeName});
  List<ProductModel> products;
  String storeName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: AppColor.backgroundColor,
          titleSpacing: 3,
          leading: InkWell(
              onTap: () {
                PersistentNavBarNavigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.blackColor,
              )),
          title: Text(
            storeName,
            style: Styles.textStyle24.copyWith(
                color: AppColor.blackColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(context,
                    screen: MakeOrderView(product: products[index]));
              },
              child: ProductItem(
                isGrid: true,
                productModel: products[index],
                widthRate: 2,
              ),
            );
          },
        ),
      ),
    );
  }
}
