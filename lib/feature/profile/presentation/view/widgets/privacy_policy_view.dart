import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            'Privacy Policy',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to the  UQPay application. Please read the following usage policy carefully before using the app.',
                  style:
                      Styles.textStyle18.copyWith(color: AppColor.blackColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '1.Privacy:',
                  style: Styles.textStyle20,
                ),
                Text(
                  'We respect your privacy and keep your personal information confidential. Please read our Privacy Policy to understand how we collect and use information.',
                  style: Styles.textStyle18.copyWith(color: AppColor.grayColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '2.Responsibility:',
                  style: Styles.textStyle20,
                ),
                Text(
                  'We are not responsible for any direct or indirect damage caused by the use or inability to use the application.',
                  style: Styles.textStyle18.copyWith(color: AppColor.grayColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '3.Content:',
                  style: Styles.textStyle20,
                ),
                Text(
                  'It is forbidden to use the application to post or publish content that is offensive, inappropriate, or contrary to local or international laws.',
                  style: Styles.textStyle18.copyWith(color: AppColor.grayColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
