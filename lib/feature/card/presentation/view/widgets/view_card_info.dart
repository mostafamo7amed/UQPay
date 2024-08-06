import 'package:UQPay/feature/home/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../core/utils/app_manager/app_color.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';
import 'card_info_widget.dart';

class ViewCardInfo extends StatelessWidget {
  const ViewCardInfo({super.key,required this.userModel});
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
            'Card Information',
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
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: AppColor.yellowColor,
                              size: 35,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Academic information',
                              style: Styles.textStyle20
                                  .copyWith(color: AppColor.blackColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'ID / username',
                          style: Styles.boldTextStyle16
                              .copyWith(color: AppColor.grayColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            color: AppColor.lightgrayColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              userModel.id!,
                              style: Styles.boldTextStyle16
                                  .copyWith(color: AppColor.blackColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Email',
                          style: Styles.boldTextStyle16
                              .copyWith(color: AppColor.grayColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            color: AppColor.lightgrayColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              userModel.email!,
                              style: Styles.boldTextStyle16
                                  .copyWith(color: AppColor.blackColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Image.asset(AssetsData.cardInfo),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Card Information',
                              style: Styles.textStyle20
                                  .copyWith(color: AppColor.blackColor),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CardInformationWidget(userModel: userModel,),
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
