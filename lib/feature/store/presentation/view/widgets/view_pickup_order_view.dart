import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:UQPay/feature/store/data/models/order_model.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/pickup_oder_details_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/utils/common.dart';
import '../../../../company/data/product_model.dart';

class ViewPickupOrderView extends StatelessWidget {
  ViewPickupOrderView({
    super.key,
    required this.orderModel,
  });

  OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomButton(
          onPressed: () {
            PersistentNavBarNavigator.pushNewScreen(context,
                screen: PickupOderDetailsView(orderModel: orderModel,));
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
            orderModel.products!.name!,
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
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColor.wihteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: orderModel.products!.image != ''
                          ? NetworkImage(orderModel.products!.image.toString())
                          : NetworkImage(noImagePlaceholder),
                    ),
                  ),
                ),
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
                  child:  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      '${orderModel.amount} SAR',
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
                      '${orderModel.products!.name}',
                      style: Styles.textStyle17.copyWith(color: AppColor.grayColor),
                    ),
                    const Spacer(),
                     Text(
                      '${orderModel.products!.amount} SAR',
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
