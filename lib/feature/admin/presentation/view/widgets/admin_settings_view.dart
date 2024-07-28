import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_routes.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminSettingsView extends StatelessWidget {
  const AdminSettingsView({super.key});

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
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.wihteColor,
              )),
          title: Text(
            'Settings',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColor.wihteColor,
                        borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(25),
                            topEnd: Radius.circular(25)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.admin_panel_settings_outlined,
                                  size: 35,
                                  color: AppColor.grayColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Ali Ahmed',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: Styles.textStyle20
                                      .copyWith(color: AppColor.blackColor),
                                ),
                              ],
                            ),
                          ),
                          SeperatedLine(),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 15, top: 10, left: 15),
                            child: Text(
                              'Account Settings',
                              style: Styles.textStyle20
                                  .copyWith(color: AppColor.grayColor),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, right: 15, left: 15),
                              child: Row(
                                children: [
                                  Text(
                                    'Profile Information',
                                    style: Styles.textStyle20
                                        .copyWith(color: AppColor.blackColor),
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.arrow_forward_ios),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: AppColor.wihteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Text(
                          'More',
                          style: Styles.textStyle20
                              .copyWith(color: AppColor.grayColor),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).push(Routes.aboutUsRoute);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'About us',
                                style: Styles.textStyle20
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).push(Routes.privecyPolicyRoute);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                'Privacy policy',
                                style: Styles.textStyle20
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).push(Routes.termConditionsRoute);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Terms and conditions',
                                style: Styles.textStyle20
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context)
                              .pushReplacement(Routes.loginRoute);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Logout',
                                style: Styles.textStyle20
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const Spacer(),
                              const Icon(Icons.logout),
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
