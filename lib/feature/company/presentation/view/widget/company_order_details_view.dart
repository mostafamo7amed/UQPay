import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CompanyOrderDetailsView extends StatelessWidget {
  const CompanyOrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
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
            'Order Details',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .9,
          decoration: BoxDecoration(
            color: AppColor.wihteColor,
            borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(24), topEnd: Radius.circular(24)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Order 342525',
                    style:
                        Styles.textStyle24.copyWith(color: AppColor.blackColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Customer name',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                        const Spacer(),
                        Text(
                          'Ahmed Mohamed',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Product',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                        const Spacer(),
                        Text(
                          'Gym Subscription',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Order type',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                        const Spacer(),
                        Text(
                          'Service',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Date',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                        const Spacer(),
                        Text(
                          '27-7-2024',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Amount',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                        const Spacer(),
                        Text(
                          '240.00 SAR',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          'Offer',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                        const Spacer(),
                        Text(
                          '20 %',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                      ],
                    ),
                  ),
                  SeperatedLine(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 30),
                    child: Row(
                      children: [
                        Text(
                          'Total',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                        const Spacer(),
                        Text(
                          '192.00 SAR',
                          style: Styles.textStyle18
                              .copyWith(color: AppColor.grayColor),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                        onPressed: () {},
                        color: AppColor.greenColor,
                        text: 'Accept',
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      CustomButton(
                        onPressed: () {},
                        color: AppColor.redColor,
                        text: 'Reject',
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      CustomButton(
                        onPressed: () {},
                        color: AppColor.primaryColor,
                        text: 'Finish',
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
