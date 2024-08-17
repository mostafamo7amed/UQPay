import 'package:UQPay/core/functions/get_operation_date_now.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../company/data/company_model.dart';
import '../../../../company/data/product_model.dart';
import '../../../data/models/order_model.dart';
import 'open_in_map_view.dart';

class PickupOderDetailsView extends StatelessWidget {
  PickupOderDetailsView({super.key,this.productModel,this.companyModel,this.orderNumber,this.orderModel});

  CompanyModel? companyModel;
  ProductModel? productModel;
  OrderModel? orderModel;
  int? orderNumber;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          titleSpacing: 3,
          leading: InkWell(
              onTap: () {
                PersistentNavBarNavigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.wihteColor,
              )),
          title: Text(
            orderModel!=null?
            'Order #${orderModel!.orderNumber!}':
            'Order #$orderNumber',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    AssetsData.successOrder,
                    height: 120,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'ORDER DETAILS',
                    style:
                        Styles.textStyle17.copyWith(color: AppColor.grayColor),
                  ),
                ),
                CardWidget(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'BRANCH',
                            style: Styles.textStyle18
                                .copyWith(color: AppColor.primaryColor),
                          ),
                          const Spacer(),
                          Text(
                            orderModel!=null?
                            '${orderModel!.companyModel!.address}':
                            '${companyModel!.address}',
                            style: Styles.textStyle18
                                .copyWith(color: AppColor.blackColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        height: 40,
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(context, screen: OpenInMapView(productModel: productModel!,
                            companyModel: companyModel!,));
                        },
                        text: 'Open in google maps',
                      )
                    ],
                  ),
                ),
                CardWidget(
                  child: Row(
                    children: [
                      Text(
                        'ORDER TYPE',
                        style: Styles.textStyle18
                            .copyWith(color: AppColor.primaryColor),
                      ),
                      const Spacer(),
                      Text(
                        orderModel!=null?
                        '${orderModel!.products!.productType}':
                        '${productModel!.productType}',
                        style: Styles.textStyle18
                            .copyWith(color: AppColor.blackColor),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'ORDER STATUS',
                    style:
                        Styles.textStyle17.copyWith(color: AppColor.grayColor),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColor.cardColor,
                      borderRadius: const BorderRadiusDirectional.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getOperationDateNow(),
                                style: Styles.textStyle18
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                              Text(
                                  getOperationDateNow(),
                                style: Styles.textStyle18
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  orderModel!=null?
                                  'Payment ${orderModel!.status}!':
                                  'Payment In Progress!',
                                  style: Styles.textStyle18
                                      .copyWith(color: AppColor.primaryColor),
                                ),
                                Text(
                                  orderModel!=null?
                                      orderModel!.status=='Accepted'?
                                      'Your order is ready to pickup':'' :
                                  'In Progress!',

                                  style: Styles.textStyle18
                                      .copyWith(color: AppColor.primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'ORDER ITEMS',
                    style:
                        Styles.textStyle17.copyWith(color: AppColor.grayColor),
                  ),
                ),
                CardWidget(
                  child: Row(
                    children: [
                      Text(
                        orderModel!=null?
                        '${orderModel!.products!.name}':
                        '${productModel!.name}',
                        style: Styles.textStyle18
                            .copyWith(color: AppColor.primaryColor),
                      ),
                      const Spacer(),
                      Text(
                        orderModel!=null?
                        '${orderModel!.products!.amount}':
                        '${productModel!.amount}',
                        style: Styles.textStyle18
                            .copyWith(color: AppColor.blackColor),
                      ),
                      Text(
                        '  SAR',
                        style: Styles.textStyle18
                            .copyWith(color: AppColor.grayColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColor.cardColor,
          borderRadius: const BorderRadiusDirectional.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: child,
        ),
      ),
    );
  }
}
