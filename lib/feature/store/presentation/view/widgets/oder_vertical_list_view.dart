import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:UQPay/feature/store/data/models/order_model.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/view_order_details.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/view_pickup_order_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class OrdersVerticalListView extends StatelessWidget {
  OrdersVerticalListView({
    super.key,
    this.hideProgress = false,
    required this.orderList,

  });
  bool? hideProgress = false;
  final List<OrderModel> orderList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: ListView.separated(
        itemBuilder: (context, index) => Card(
          color: AppColor.wihteColor,
          elevation: 4,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 100,
                      child: Image.network(
                        orderList[index].products!.image!,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          orderList[index].companyModel!.name!,
                          style: Styles.textStyle20
                              .copyWith(color: AppColor.blackColor),
                        ),
                        Text(
                          'Order no: ${orderList[index].orderNumber}',
                          style: Styles.regularTextStyle14
                              .copyWith(color: AppColor.blackColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            right: 20,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Amount',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.grayColor),
                              ),
                              const Spacer(),
                              Text(
                                '${orderList[index].amount} SAR',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.grayColor),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, right: 20, bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                'Order Type',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.grayColor),
                              ),
                              const Spacer(),
                              Text(
                                orderList[index].orderType!,
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.grayColor),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SeparatedLine(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  hideProgress == false
                      ? CustomButton(
                          onPressed: (){},
                          color: AppColor.wihteColor,
                          textColor: AppColor.yellowColor,
                          text: 'Reorder',
                          width: MediaQuery.of(context).size.width / 3,
                        )
                      : const SizedBox(),
                  hideProgress == false ? const Spacer() : const SizedBox(),
                  CustomButton(
                    onPressed: (){
                      if(orderList[index].orderType=='Service') {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: ViewOrderDetails(
                              orderModel: orderList[index],));
                      }else{
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: ViewPickupOrderView(
                              orderModel: orderList[index],
                            ));
                      }
                    },
                    color: AppColor.wihteColor,
                    textColor: AppColor.yellowColor,
                    overlayColor: AppColor.wihteColor,
                    text: 'Details',
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                ],
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: orderList.length,
      ),
    );
  }
}
