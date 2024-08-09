import 'package:UQPay/feature/card/presentation/view/widgets/card_benefits_view.dart';
import 'package:UQPay/feature/card/presentation/view/widgets/more_options_view.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_color.dart';
import '../../../../core/utils/app_manager/app_styles.dart';
import '../../../../core/widgets/basic_functions_widget.dart';
import 'widgets/card_info_widget.dart';
import 'widgets/latest_operation.dart';
import 'widgets/view_card_info.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var cubit =HomeCubit.getCubit(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          titleSpacing: 3,
          title: Text(
            'Card',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.backgroundColor,
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(24),
                      topEnd: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Padding(
                          padding:const EdgeInsets.all(10.0),
                          child: CardInformationWidget(userModel: cubit.userModel!,),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.wihteColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Available Amount',
                                        style: Styles.regularTextStyle16
                                            .copyWith(
                                                color: AppColor.primaryColor),
                                      ),
                                      Text(
                                        '${cubit.userModel!.cardAmount!} SAR',
                                        style: Styles.regularTextStyle16
                                            .copyWith(
                                                color: AppColor.blackColor),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Cashback earned',
                                        style: Styles.regularTextStyle16
                                            .copyWith(
                                                color: AppColor.primaryColor),
                                      ),
                                      Text(
                                        '${cubit.userModel!.cashBacks!} SAR',
                                        style: Styles.regularTextStyle16
                                            .copyWith(
                                                color: AppColor.blackColor),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: AppColor.yellowColor,
                                width: 1,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: BasicFunctionsWidget(
                                            title: 'Card Information',
                                            asset: AssetsData.cardInfo,
                                            stokeColor: AppColor.yellowColor,
                                            backgroundColor:
                                                AppColor.backgroundColor,
                                            onTap: () {
                                              PersistentNavBarNavigator
                                                  .pushNewScreen(context,
                                                      screen: ViewCardInfo(userModel: cubit.userModel!,));
                                            }),
                                      ),
                                      Expanded(
                                        child: BasicFunctionsWidget(
                                            title: 'Latest Operations',
                                            asset: AssetsData.handMoney,
                                            stokeColor: AppColor.yellowColor,
                                            backgroundColor:
                                                AppColor.backgroundColor,
                                            onTap: () {
                                              PersistentNavBarNavigator
                                                  .pushNewScreen(context,
                                                      screen: LatestOperationView(userModel: cubit.userModel!,));
                                            }),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: BasicFunctionsWidget(
                                            title: 'Card Benefits',
                                            asset: AssetsData.listDoneImage,
                                            stokeColor: AppColor.yellowColor,
                                            backgroundColor:
                                                AppColor.backgroundColor,
                                            onTap: () {
                                              PersistentNavBarNavigator
                                                  .pushNewScreen(context,
                                                      screen: CardBenefitsView(userModel: cubit.userModel!,));
                                            }),
                                      ),
                                      Expanded(
                                        child: BasicFunctionsWidget(
                                            title: 'More Options',
                                            asset: AssetsData.moreOptinsImage,
                                            stokeColor: AppColor.yellowColor,
                                            backgroundColor:
                                                AppColor.backgroundColor,
                                            onTap: () {
                                              PersistentNavBarNavigator
                                                  .pushNewScreen(context,
                                                      screen: MoreOptionsView(userModel: cubit.userModel!,));
                                            }),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
  },
);
  }
}
