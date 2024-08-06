import 'package:UQPay/feature/card/presentation/view/widgets/view_card_info.dart';
import 'package:UQPay/feature/home/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/utils/app_manager/app_color.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';

class MoreOptionsView extends StatelessWidget {
  const MoreOptionsView({super.key,required this.userModel});
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
            'More Options',
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
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Card Management',
                          style: Styles.textStyle20
                              .copyWith(color: AppColor.blackColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.grayColor,
                              width: 1,
                            ),
                            borderRadius: const BorderRadiusDirectional.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.payment,
                                    size: 35,
                                    color: AppColor.yellowColor,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Pause the card temporarily',
                                    style: Styles.regularTextStyle14
                                        .copyWith(color: AppColor.blackColor),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Spacer(),
                                  Switch(value: false, onChanged: (value) {}),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: (){
                                  PersistentNavBarNavigator.pushNewScreen(context, screen: ViewCardInfo(userModel: userModel,));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.payment,
                                      size: 35,
                                      color: AppColor.yellowColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'View card data',
                                      style: Styles.regularTextStyle14
                                          .copyWith(color: AppColor.blackColor),
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.shopping_cart,
                                    size: 35,
                                    color: AppColor.yellowColor,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Enable online payments',
                                    style: Styles.regularTextStyle14
                                        .copyWith(color: AppColor.blackColor),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Spacer(),
                                  Switch(
                                    value: false,
                                    onChanged: (value) {},
                                    activeColor: AppColor.grayColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Safety',
                          style: Styles.textStyle20
                              .copyWith(color: AppColor.blackColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.grayColor,
                              width: 1,
                            ),
                            borderRadius: const BorderRadiusDirectional.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.security,
                                size: 35,
                                color: AppColor.yellowColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Security settings',
                                style: Styles.regularTextStyle14
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios),
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
