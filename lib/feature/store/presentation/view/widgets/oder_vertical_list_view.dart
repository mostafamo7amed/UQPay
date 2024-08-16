import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:UQPay/feature/store/data/models/order_model.dart';
import 'package:flutter/material.dart';

class OrdersVerticalListView extends StatelessWidget {
  OrdersVerticalListView({
    super.key,
    this.hideProgress = false,
    required this.detailsTap,
    required this.reorderTap,
    this.orderModel,

  });
  bool? hideProgress = false;
  void Function()? detailsTap;
  void Function()? reorderTap;
  OrderModel? orderModel;

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
                        orderModel!.companyModel!.image!,
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
                          orderModel!.companyModel!.name!,
                          style: Styles.textStyle20
                              .copyWith(color: AppColor.blackColor),
                        ),
                        Text(
                          'Order no: ${orderModel!.orderNumber}',
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
                                '${orderModel!.amount} SAR',
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
                                orderModel!.orderType!,
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
              SeperatedLine(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  hideProgress == false
                      ? CustomButton(
                          onPressed: reorderTap,
                          color: AppColor.wihteColor,
                          textColor: AppColor.yellowColor,
                          text: 'Reoder',
                          width: MediaQuery.of(context).size.width / 3,
                        )
                      : SizedBox(),
                  hideProgress == false ? const Spacer() : SizedBox(),
                  CustomButton(
                    onPressed: detailsTap,
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
        itemCount: 10,
      ),
    );
  }
}
