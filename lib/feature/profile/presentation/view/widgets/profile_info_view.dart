import 'package:UQPay/feature/home/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';

class ProfileInfoView extends StatelessWidget {
  const ProfileInfoView({super.key,required this.userModel});
  final UserModel userModel;

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
                                  userModel.image!=''?
                                  Image.network(userModel.image!,
                                    fit: BoxFit.cover,
                                  ):
                                  Image.asset(
                                    AssetsData.personMask,
                                    fit: BoxFit.cover,
                                  ),
                                ]),
                          ),
                        ),
                        Text(
                          userModel.name!,
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
                            color: AppColor.lightgrayColor.withOpacity(0.3),
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
                                userModel.id!,
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SeparatedLine(
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
                                userModel.email!,
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SeparatedLine(
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
                                userModel.gender!,
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SeparatedLine(
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
                                userModel.birthDate!,
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SeparatedLine(
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
                                userModel.mobileNumber!,
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SeparatedLine(
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
                                userModel.department!,
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
