import 'package:UQPay/feature/card/presentation/view/widgets/cashback_view.dart';
import 'package:UQPay/feature/card/presentation/view/widgets/payment_view.dart';
import 'package:UQPay/feature/home/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../core/utils/app_manager/app_color.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';
import 'card_info_widget.dart';

class CardBenefitsView extends StatelessWidget {
  const CardBenefitsView({super.key,required this.userModel});
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
            'Card Benefits',
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child:  CardInformationWidget(userModel: userModel,),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(context,
                                screen: CashbackView(userModel: userModel,));
                          },
                          child: ContainerCircleWidget(
                            child: Row(
                              children: [
                                Image.asset(
                                  AssetsData.cashBack,
                                  color: AppColor.yellowColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'CashBack',
                                  textAlign: TextAlign.center,
                                  style: Styles.textStyle18.copyWith(
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        InkWell(
                          onTap: () {

                          },
                          child: ContainerCircleWidget(
                            child: Row(
                              children: [
                                Image.asset(
                                    AssetsData.settingIcon,
                                  color: AppColor.yellowColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Control & Manage',
                                  textAlign: TextAlign.center,
                                  style: Styles.textStyle18.copyWith(
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(context,
                                screen: PaymentView( userModel: userModel,));
                          },
                          child: ContainerCircleWidget(
                            child: Row(
                              children: [
                                Image.asset(AssetsData.handMoney),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Payments',
                                  textAlign: TextAlign.center,
                                  style: Styles.textStyle18.copyWith(
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
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

class ContainerCircleWidget extends StatelessWidget {
  ContainerCircleWidget({
    super.key,
    required this.child,
  });
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColor.lightgrayColor,
        borderRadius: const BorderRadiusDirectional.all(
          Radius.circular(16),
        ),
      ),
      child: child,
    );
  }
}
