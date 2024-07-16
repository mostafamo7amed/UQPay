import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:uq_pay/core/utils/app_manager/app_assets.dart';
import 'package:uq_pay/core/utils/app_manager/app_color.dart';
import 'package:uq_pay/core/utils/app_manager/app_styles.dart';
import 'package:uq_pay/core/widgets/seperated_line.dart';

class ProfileInfoView extends StatelessWidget {
  const ProfileInfoView({super.key});

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
            'My Profile',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.wihteColor,
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(24),
                      topEnd: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColor.grayColor,
                          radius: 41,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: AppColor.wihteColor,
                            child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Image.asset(
                                    AssetsData.personMask,
                                    fit: BoxFit.cover,
                                  ),
                                ]),
                          ),
                        ),
                        Text(
                          'Mohammed Ali',
                          style: Styles.textStyle20
                              .copyWith(color: AppColor.blackColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: AppColor.lightgrayColor,
                            borderRadius: const BorderRadiusDirectional.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'User ID',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                              Text(
                                '442345678',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SeperatedLine(
                                color: AppColor.grayColor,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'ID Number',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                              Text(
                                '1117234567',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SeperatedLine(
                                color: AppColor.grayColor,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'University Email',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                              Text(
                                's442345678@st.uqu.edu.sa',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SeperatedLine(
                                color: AppColor.grayColor,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Gender',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                              Text(
                                'Male',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SeperatedLine(
                                color: AppColor.grayColor,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Birth Date',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                              Text(
                                '2002-02-19',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SeperatedLine(
                                color: AppColor.grayColor,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Mobile Number',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                              Text(
                                '966572844309',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SeperatedLine(
                                color: AppColor.grayColor,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Main Department',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                              Text(
                                'Jamoum University College',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SeperatedLine(
                                color: AppColor.grayColor,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Department',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                              Text(
                                'Computer Science - Jamoum University College',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
