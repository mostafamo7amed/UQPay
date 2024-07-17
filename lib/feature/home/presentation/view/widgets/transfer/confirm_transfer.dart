import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';

class ConfirmTransferView extends StatelessWidget {
  const ConfirmTransferView({super.key});

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
            ),
          ),
        ),
        body: Column(
          children: [
            Image.asset(AssetsData.money),
            const SizedBox(
              height: 5,
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
                          'Your transaction has been submitted',
                          textAlign: TextAlign.center,
                          style: Styles.textStyle24
                              .copyWith(color: AppColor.blackColor),
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
                              Center(
                                child: Text(
                                  'Transfer Details',
                                  style: Styles.textStyle18
                                      .copyWith(color: AppColor.yellowColor),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
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
                                height: 10,
                              ),
                              Text(
                                'To',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                              Text(
                                'Dana Nahari',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Date',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                              Text(
                                '25/5/2024',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
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
