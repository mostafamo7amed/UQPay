import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';

class SendGiftReviewScreen extends StatelessWidget {
  const SendGiftReviewScreen({super.key});

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
            'Send Gift',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                PersistentNavBarNavigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'cancel',
                  style: Styles.regularTextStyle16
                      .copyWith(color: AppColor.wihteColor),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.wihteColor,
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(24),
                      topEnd: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Gift Review',
                          style: Styles.textStyle24
                              .copyWith(color: AppColor.yellowColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: AppColor.lightgrayColor,
                            borderRadius: const BorderRadiusDirectional.all(
                              Radius.circular(24),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Card Details',
                                    style: Styles.textStyle18
                                        .copyWith(color: AppColor.yellowColor),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      PersistentNavBarNavigator.pop(context);
                                    },
                                    child: Text(
                                      'Edit',
                                      style: Styles.textStyle18
                                          .copyWith(color: AppColor.grayColor),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Amount',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                              Text(
                                '1000 SAR',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Message',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                              Text(
                                'I want to express my thanks for helping me today at the shop.',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Name',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                              Text(
                                'Your friend',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: AppColor.lightgrayColor,
                            borderRadius: const BorderRadiusDirectional.all(
                              Radius.circular(24),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'To',
                                    style: Styles.textStyle18
                                        .copyWith(color: AppColor.yellowColor),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      PersistentNavBarNavigator.pop(context);
                                    },
                                    child: Text(
                                      'Edit',
                                      style: Styles.textStyle18
                                          .copyWith(color: AppColor.grayColor),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Rafal Mousa',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '8836  7325  2625  1125',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          onPressed: () {},
                          text: 'Confirm',
                          width: MediaQuery.of(context).size.width / 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
