import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/feature/admin/presentation/manager/admin_cubit.dart';
import 'package:UQPay/feature/admin/presentation/view/widgets/admin_deposit_machine_screen.dart';
import 'package:UQPay/feature/admin/presentation/view/widgets/admin_manage_category.dart';
import 'package:UQPay/feature/admin/presentation/view/widgets/admin_manage_company_screen.dart';
import 'package:UQPay/feature/admin/presentation/view/widgets/admin_notification_screen.dart';
import 'package:UQPay/feature/admin/presentation/view/widgets/admin_recharge_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../../core/widgets/basic_functions_widget.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is GetAdminSuccessState) {
          AdminCubit.getCubit(context).getAdminNotificationToken();
          AdminCubit.getCubit(context).getAllCompany();
          AdminCubit.getCubit(context).getAllUsers();
          AdminCubit.getCubit(context).getNotificationDB();
          AdminCubit.getCubit(context).getAllCategory();
        }
      },
      builder: (context, state) {
        var cubit = AdminCubit.getCubit(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.primaryColor,
            ),
            backgroundColor: AppColor.primaryColor,
            body: cubit.adminModel != null
                ? SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          cubit.getNotificationDB();
                                          PersistentNavBarNavigator.pushNewScreen(
                                              context,
                                              screen:
                                                  const AdminNotificationScreen());
                                        },
                                        child: Stack(
                                          children: [
                                            const Icon(
                                              Icons.notifications_none_outlined,
                                              size: 32,
                                            ),
                                            if (cubit.isNotificationOpened ==
                                                false)
                                              Container(
                                                height: 15,
                                                width: 15,
                                                padding: EdgeInsets.zero,
                                                decoration: BoxDecoration(
                                                    color: AppColor.redColor,
                                                    shape: BoxShape.circle),
                                                child: Center(
                                                  child: Text(
                                                    '${cubit.notificationCounter}',
                                                    style: Styles.textStyle12
                                                        .copyWith(
                                                            color: AppColor
                                                                .wihteColor,
                                                            height: 0),
                                                  ),
                                                ),
                                              )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(14),
                                  width: MediaQuery.of(context).size.width,
                                  height: 190,
                                  decoration: BoxDecoration(
                                    color:
                                        AppColor.primaryColor.withOpacity(.8),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Good morning',
                                        style: Styles.textStyle24.copyWith(
                                            color: AppColor.wihteColor,
                                            fontWeight: FontWeight.bold),
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
                                            cubit.adminModel!.name!,
                                            style: Styles.textStyle20.copyWith(
                                                color: AppColor.wihteColor),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Id: ${cubit.adminModel!.id!}',
                                        style: Styles.textStyle18.copyWith(
                                            color: AppColor.wihteColor),
                                      ),
                                    ],
                                  ),
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
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
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
                                                title: 'Company',
                                                asset: AssetsData.usersImage,
                                                onTap: () {
                                                  PersistentNavBarNavigator
                                                      .pushNewScreen(context,
                                                          screen:
                                                              const AdminManageCompanyScreen());
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: BasicFunctionsWidget(
                                                title: 'Deposit machine',
                                                asset:
                                                    AssetsData.placeHolderIcon,
                                                onTap: () {
                                                  PersistentNavBarNavigator
                                                      .pushNewScreen(context,
                                                          screen:
                                                              const AdminDepositMachineScreen());
                                                },
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
                                                title: 'Manage category',
                                                asset: AssetsData.cartIcon,
                                                onTap: () {
                                                  PersistentNavBarNavigator
                                                      .pushNewScreen(context,
                                                          screen:
                                                              const AdminManageCategory());
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: BasicFunctionsWidget(
                                                title: 'Recharge card',
                                                asset: AssetsData.depositImage,
                                                onTap: () {
                                                  PersistentNavBarNavigator
                                                      .pushNewScreen(context,
                                                          screen:
                                                              const AdminRechargeCardScreen());
                                                },
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
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      },
    );
  }
}
