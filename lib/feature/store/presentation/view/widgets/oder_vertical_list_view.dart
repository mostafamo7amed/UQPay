import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:UQPay/feature/store/data/models/product_model.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/oder_details_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/view_order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class OrdersVerticalListView extends StatelessWidget {
  OrdersVerticalListView({
    super.key,
    this.hideProgress = false,
    required this.detailsTap,
    required this.reorderTap,
  });
  bool? hideProgress = false;
  void Function()? detailsTap;
  void Function()? reorderTap;

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
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsmclv_H61WP7SHs4yMz0WIR2QLxqRnRnmOw&s',
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
                          'Fitness Gym',
                          style: Styles.textStyle20
                              .copyWith(color: AppColor.blackColor),
                        ),
                        Text(
                          'Order no: 342525',
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
                                '240.00 SAR',
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
                                'Payment status',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.grayColor),
                              ),
                              const Spacer(),
                              Text(
                                'Paid in full',
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
