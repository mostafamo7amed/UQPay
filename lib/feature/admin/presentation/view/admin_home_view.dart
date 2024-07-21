import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/basic_functions_widget.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
        ),
        backgroundColor: AppColor.primaryColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: AppColor.wihteColor,
            borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(24), topEnd: Radius.circular(24)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColor.primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: SizedBox(
                          height: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Good morning',
                                style: Styles.textStyle24
                                    .copyWith(color: AppColor.wihteColor),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Image.asset(
                                    AssetsData.person,
                                    color: AppColor.wihteColor,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Ali Ahmed',
                                    style: Styles.textStyle20
                                        .copyWith(color: AppColor.wihteColor),
                                  ),
                                ],
                              ),
                              Text(
                                'Administrator',
                                style: Styles.textStyle20
                                    .copyWith(color: AppColor.wihteColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BasicFunctionsWidget(
                      title: 'Users',
                      asset: AssetsData.usersImage,
                      onTap: () {},
                    ),
                    BasicFunctionsWidget(
                      title: 'Recharge',
                      asset: AssetsData.depositImage,
                      onTap: () {},
                    ),
                    BasicFunctionsWidget(
                      title: 'Deposit',
                      asset: AssetsData.placeHolderIcon,
                      onTap: () {},
                    ),
                    BasicFunctionsWidget(
                      title: 'Settings',
                      asset: AssetsData.settingIcon,
                      onTap: () {},
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
