import 'package:UQPay/core/utils/app_manager/app_routes.dart';
import 'package:UQPay/feature/profile/presentation/manager/profile_cubit.dart';
import 'package:UQPay/feature/profile/presentation/view/widgets/about_us_view.dart';
import 'package:UQPay/feature/profile/presentation/view/widgets/privacy_policy_view.dart';
import 'package:UQPay/feature/profile/presentation/view/widgets/terms_and_conditions_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:UQPay/feature/profile/presentation/view/widgets/profile_info_view.dart';

import '../../../../core/cache_helper/cache_helper.dart';
import '../../../../core/utils/common.dart';
import '../../../../core/widgets/change_password.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUser(uid),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = ProfileCubit.getCubit(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColor.backgroundColor,
              appBar: AppBar(
                backgroundColor: AppColor.primaryColor,
                titleSpacing: 3,
                leading: Icon(
                  Icons.settings,
                  color: AppColor.wihteColor,
                  size: 40,
                ),
                title: Text(
                  'Settings',
                  style: Styles.textStyle24.copyWith(
                      color: AppColor.wihteColor, fontWeight: FontWeight.bold),
                ),
              ),
              body: cubit.userModel != null
                  ? SingleChildScrollView(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  height: 160,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: AppColor.wihteColor,
                                    borderRadius:
                                        const BorderRadiusDirectional.only(
                                            topStart: Radius.circular(25),
                                            topEnd: Radius.circular(25)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.person_3_outlined,
                                              size: 35,
                                              color: AppColor.grayColor,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              cubit.userModel!.name!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: Styles.textStyle20
                                                  .copyWith(
                                                      color:
                                                          AppColor.blackColor),
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
                                          style: Styles.textStyle20.copyWith(
                                              color: AppColor.grayColor),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          PersistentNavBarNavigator
                                              .pushNewScreen(context,
                                                  screen: ProfileInfoView(userModel: cubit.userModel!,));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, right: 15, left: 15),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Profile Information',
                                                style: Styles.textStyle20
                                                    .copyWith(
                                                        color: AppColor
                                                            .blackColor),
                                              ),
                                              const Spacer(),
                                              const Icon(
                                                  Icons.arrow_forward_ios),
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
                                  InkWell(
                                    onTap :(){
                                      PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: ChangePasswordScreen());
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, right: 15, left: 15),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Change password',
                                            style: Styles.textStyle20.copyWith(
                                                color: AppColor.blackColor),
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.arrow_forward_ios),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, right: 15, left: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Push Notification',
                                          style: Styles.textStyle20.copyWith(
                                              color: AppColor.blackColor),
                                        ),
                                        const Spacer(),
                                        Switch(
                                            activeColor: AppColor.greenColor,
                                            inactiveTrackColor:
                                                AppColor.lightgrayColor,
                                            value: cubit.pushNotification,
                                            onChanged: (value) {
                                              cubit.changePushNotification();
                                            }),
                                      ],
                                    ),
                                  ),
                                  SeperatedLine(),
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
                                      PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: const AboutUsView());
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
                                            style: Styles.textStyle20.copyWith(
                                                color: AppColor.blackColor),
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.arrow_forward_ios),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: const PrivacyPolicyView());
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Privacy policy',
                                            style: Styles.textStyle20.copyWith(
                                                color: AppColor.blackColor),
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.arrow_forward_ios),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen:
                                              const TermsAndConditionsView());
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
                                            style: Styles.textStyle20.copyWith(
                                                color: AppColor.blackColor),
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.arrow_forward_ios),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      FirebaseAuth.instance.signOut();
                                      uid = '';
                                      CacheHelper.removeData(key: 'email');
                                      CacheHelper.removeData(key: 'password');
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
                                            style: Styles.textStyle20.copyWith(
                                                color: AppColor.blackColor),
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
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          );
        },
      ),
    );
  }
}
