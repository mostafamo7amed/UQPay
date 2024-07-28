import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

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
            'About us',
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
                  'Welcome to the  UQPay application.',
                  style:
                      Styles.textStyle18.copyWith(color: AppColor.blackColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '1.About us:',
                  style: Styles.textStyle20,
                ),
                Text(
                  'The project aims to address the issue of ambiguity and lack of knowledge among Umm Al Qura University staff regarding the benefits, including offers and discounts, associated with their affiliation. The current difficulty in searching on the universitys website leads to wasted time, and incomplete details. Additionally, entities providing these offers may struggle to attract Umm Al-Qura University staff as visitors. To resolve these challenges, the project will develop an accessible application that connects students and staff with relevant benefits and services. This application will simplify the presentation of prices and discounts, reducing the time and effort required for service searches. It will also expand the universitys cooperation with more entities, generating increased financial gains. Consequently, the application will enhance staffs access to available offers and discounts while promoting the universitys partnerships with other businesses.',
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
