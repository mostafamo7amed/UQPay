import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_routes.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/widgets/basic_functions_widget.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          titleSpacing: 20,
          title: Text(
            'Good morning, Ali',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: AppColor.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .9,
                decoration: BoxDecoration(
                  color: AppColor.wihteColor,
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(24),
                      topEnd: Radius.circular(24)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AssetsData.person,
                            color: AppColor.blackColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Ali Ahmed',
                            style: Styles.textStyle20
                                .copyWith(color: AppColor.blackColor),
                          ),
                        ],
                      ),
                      Text(
                        'Administrator',
                        style: Styles.textStyle18
                            .copyWith(color: AppColor.grayColor),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: AppColor.yellowColor,
                            width: 1,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: BasicFunctionsWidget(
                                      title: 'Manage company',
                                      asset: AssetsData.usersImage,
                                      onTap: () {
                                        GoRouter.of(context).push(
                                            Routes.adminManageCompanyRoute);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: BasicFunctionsWidget(
                                      title: 'Recharge cards',
                                      asset: AssetsData.depositImage,
                                      onTap: () {},
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: BasicFunctionsWidget(
                                      title: 'Deposit machines',
                                      asset: AssetsData.placeHolderIcon,
                                      onTap: () {},
                                    ),
                                  ),
                                  Expanded(
                                    child: BasicFunctionsWidget(
                                      title: 'Settings',
                                      asset: AssetsData.settingIcon,
                                      onTap: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
