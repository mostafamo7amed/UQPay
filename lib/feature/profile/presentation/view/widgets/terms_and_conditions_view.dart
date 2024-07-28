import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

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
            'Terms and conditions',
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
                  'Welcome to the  UQPay application. Please read the following usage terms carefully before using the app.',
                  style:
                      Styles.textStyle18.copyWith(color: AppColor.blackColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '1.Acceptance of the terms:',
                  style: Styles.textStyle20,
                ),
                Text(
                  'By using this app, you agree to all the terms and conditions stated here. If you do not agree with any part of these Terms, please do not use the application.',
                  style: Styles.textStyle18.copyWith(color: AppColor.grayColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '2.Updates:',
                  style: Styles.textStyle20,
                ),
                Text(
                  'We reserve the right to change or update the terms of use at any time without prior notice. You should periodically review the terms to make sure you agree with them.',
                  style: Styles.textStyle18.copyWith(color: AppColor.grayColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '3.Termination of Service:',
                  style: Styles.textStyle20,
                ),
                Text(
                  'We reserve the right to discontinue or suspend the application services at any time without prior notice.',
                  style: Styles.textStyle18.copyWith(color: AppColor.grayColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '4.Contact:',
                  style: Styles.textStyle20,
                ),
                Text(
                  'For any queries or feedback, please contact us via [support mail] or [phone number].',
                  style: Styles.textStyle18.copyWith(color: AppColor.grayColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Thank you for using UQPay.',
                  style:
                      Styles.textStyle18.copyWith(color: AppColor.blackColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
