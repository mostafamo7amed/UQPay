import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:uq_pay/core/utils/app_manager/app_assets.dart';
import 'package:uq_pay/core/utils/app_manager/app_color.dart';
import 'package:uq_pay/core/utils/app_manager/app_styles.dart';
import 'package:uq_pay/core/widgets/custom_button.dart';
import 'package:uq_pay/feature/home/presentation/view/widgets/save_account/add_new_target.dart';
import 'package:uq_pay/feature/home/presentation/view/widgets/save_account/my_targets_view.dart';

class SaveAccountView extends StatelessWidget {
  const SaveAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          titleSpacing: 3,
          leading: Image.asset(AssetsData.saveAccountIcon),
          title: Text(
            'Savings Account',
            style: Styles.boldTextStyle16.copyWith(color: AppColor.wihteColor),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications_none_outlined,
                size: 28,
                color: AppColor.wihteColor,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: AppColor.wihteColor,
              borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(24), topEnd: Radius.circular(24)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'We help you to',
                  style:
                      Styles.textStyle20.copyWith(color: AppColor.yellowColor),
                ),
                Text(
                  'achieve your dreams',
                  style:
                      Styles.textStyle20.copyWith(color: AppColor.yellowColor),
                ),
                Text(
                  'and save your money',
                  style:
                      Styles.textStyle20.copyWith(color: AppColor.yellowColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: AddNewTarget());
                  },
                  text: 'Add New Target',
                  width: (MediaQuery.of(context).size.width - 20) / 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: const MyTargetsView());
                  },
                  text: 'My Targets',
                  width: (MediaQuery.of(context).size.width - 20) / 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
