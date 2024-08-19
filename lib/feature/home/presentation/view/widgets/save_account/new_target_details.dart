import 'package:UQPay/feature/home/presentation/manager/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';

import '../../../../../../core/utils/common.dart';
import '../../../manager/cubit/home_cubit.dart';

class NewTargetDetails extends StatelessWidget {
  const NewTargetDetails({
    super.key,
    required this.numberOfDays,
    required this.targetName,
    required this.numberOfMonths,
    required this.amount,
  });

  final int numberOfDays;
  final String targetName;
  final int numberOfMonths;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    if(state is HomeAddTargetSuccessState){
      HomeCubit.getCubit(context).getUserTargets(uid);
      Navigator.pop(context);
      Navigator.pop(context);
    }
  },
  builder: (context, state) {
    var cubit = HomeCubit.getCubit(context);
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
            style:
                  Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                AssetsData.newTargetIcon,
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
                          targetName,
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
                              '$amount',
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
                              '$numberOfMonths',
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
                              '$numberOfDays',
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
                              "${cubit.targetAmount}",
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              onPressed: () {
                                cubit.addNewTarget(amount, numberOfMonths, numberOfDays, targetName);

                                },
                              text: 'Add',
                              isLoading: state is HomeAddTargetLoadingState,
                              width: (MediaQuery.of(context).size.width) / 4,
                            ),
                          ],
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
  },
);
  }
}
