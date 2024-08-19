import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:UQPay/feature/company/data/company_model.dart';
import 'package:UQPay/feature/company/data/product_model.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/order_location_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/utils/common.dart';

class MakeOrderView extends StatelessWidget {
  const MakeOrderView({
    super.key,
    required this.product,
    required this.companyModel
  });

  final ProductModel product;
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomButton(
          onPressed: () {
            PersistentNavBarNavigator.pushNewScreen(context,
                screen: OrderLocationView(
                  companyModel: companyModel,
                  productModel: product,
                ),
            );
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
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColor.wihteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: product.image != ''
                          ? NetworkImage(product.image.toString())
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
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      '${product.amount} SAR',
                      style: Styles.textStyle20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SeparatedLine(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.description!,
                  style: Styles.textStyle17.copyWith(color: AppColor.grayColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
