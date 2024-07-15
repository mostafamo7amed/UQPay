import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:uq_pay/core/utils/app_manager/app_assets.dart';
import 'package:uq_pay/core/utils/app_manager/app_color.dart';
import 'package:uq_pay/core/utils/app_manager/app_styles.dart';
import 'package:uq_pay/core/widgets/custom_button.dart';
import 'package:uq_pay/feature/home/presentation/view/widgets/save_account/target_graph_view.dart';

class TargetDetailsView extends StatelessWidget {
  const TargetDetailsView({super.key});

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
            'Target Details',
            style: Styles.boldTextStyle16.copyWith(color: AppColor.wihteColor),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                AssetsData.targetIcon,
                height: 100,
              ),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Target Name',
                          style: Styles.textStyle24
                              .copyWith(color: AppColor.yellowColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width / 1.3,
                          color: AppColor.primaryColor,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'The plan to achieve the target',
                          style: Styles.textStyle20
                              .copyWith(color: AppColor.blackColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Monthly savings amount:',
                              style: Styles.textStyle18
                                  .copyWith(color: AppColor.primaryColor),
                            ),
                            const Spacer(),
                            Text(
                              '250',
                              style: Styles.textStyle18
                                  .copyWith(color: AppColor.blackColor),
                            ),
                            Text(
                              '  SAR',
                              style: Styles.textStyle18
                                  .copyWith(color: AppColor.grayColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              'Achievement Timeframe:',
                              style: Styles.textStyle18
                                  .copyWith(color: AppColor.primaryColor),
                            ),
                            const Spacer(),
                            Text(
                              '10',
                              style: Styles.textStyle18
                                  .copyWith(color: AppColor.blackColor),
                            ),
                            Text(
                              '  Months',
                              style: Styles.textStyle18
                                  .copyWith(color: AppColor.grayColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              'Deduction day:',
                              style: Styles.textStyle18
                                  .copyWith(color: AppColor.primaryColor),
                            ),
                            const Spacer(),
                            Text(
                              '28',
                              style: Styles.textStyle18
                                  .copyWith(color: AppColor.blackColor),
                            ),
                            Text(
                              '  Days',
                              style: Styles.textStyle18
                                  .copyWith(color: AppColor.grayColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width / 1.3,
                          color: AppColor.primaryColor,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              'Total savings amount:',
                              style: Styles.textStyle18
                                  .copyWith(color: AppColor.primaryColor),
                            ),
                            const Spacer(),
                            Text(
                              '2500',
                              style: Styles.textStyle18
                                  .copyWith(color: AppColor.blackColor),
                            ),
                            Text(
                              '  SAR',
                              style: Styles.textStyle18
                                  .copyWith(color: AppColor.grayColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          onPressed: () {
                            PersistentNavBarNavigator.pushNewScreen(context,
                                screen: const TargetGraphView());
                          },
                          text: 'View Graph',
                          width: (MediaQuery.of(context).size.width) / 3.5,
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
