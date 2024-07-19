import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:flutter/material.dart';

class OrdersVerticalListView extends StatelessWidget {
  const OrdersVerticalListView({
    super.key,
  });

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
                  CustomButton(
                    onPressed: () {},
                    color: AppColor.wihteColor,
                    textColor: AppColor.yellowColor,
                    text: 'Reoder',
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                  const Spacer(),
                  CustomButton(
                    onPressed: () {},
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
