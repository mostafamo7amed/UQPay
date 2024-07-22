import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
          'Notifications',
          style: Styles.textStyle24.copyWith(
              color: AppColor.wihteColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
    ));
  }
}
