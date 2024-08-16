import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/order_location_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/pickup_oder_details_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../company/data/product_model.dart';

class ViewPickupOrderView extends StatelessWidget {
  ViewPickupOrderView({
    super.key,
    required this.product,
  });

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomButton(
          onPressed: () {
            PersistentNavBarNavigator.pushNewScreen(context,
                screen: const PickupOderDetailsView());
          },
          text: 'Continue',
        ),
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
            product.name!,
            style: Styles.textStyle24.copyWith(
                color: AppColor.blackColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(child: Image.asset(product.image!)),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Amount',
                  style: Styles.textStyle20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.grayColor)),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      '200 SAR',
                      style: Styles.textStyle20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SeperatedLine(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Cartadio',
                      style: Styles.textStyle17.copyWith(color: AppColor.grayColor),
                    ),
                    const Spacer(),
                     Text(
                      '13:00 SAR',
                      style: Styles.textStyle17.copyWith(color: AppColor.grayColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
