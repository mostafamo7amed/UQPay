import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:uq_pay/core/utils/app_manager/app_assets.dart';
import 'package:uq_pay/core/utils/app_manager/app_color.dart';
import 'package:uq_pay/core/utils/app_manager/app_styles.dart';
import 'package:uq_pay/core/widgets/custom_button.dart';
import 'package:uq_pay/feature/home/presentation/view/widgets/save_account/target_details_view.dart';

class MyTargetsView extends StatelessWidget {
  const MyTargetsView({super.key});

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
            'My Targets',
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
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: AppColor.wihteColor,
              borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(24), topEnd: Radius.circular(24)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomButton(
                      color: AppColor.lightgrayColor,
                      width: 200,
                      onPressed: () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: const TargetDetailsView());
                      },
                      text: 'new labtop',
                      textColor: AppColor.blackColor,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: 10),
            ),
          ),
        ),
      ),
    );
  }
}