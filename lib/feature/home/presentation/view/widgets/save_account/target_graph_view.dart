import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/home/data/models/target_model.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_state.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/save_account/defualt_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';

import '../../../../../../core/utils/common.dart';
import '../../../../../../core/widgets/seperated_line.dart';

class TargetGraphView extends StatelessWidget {
  TargetGraphView(
      {super.key, required this.targetModel, required this.targetPercent});
  final TargetModel targetModel;
  final double targetPercent;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController nameCtController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if(state is HomeEditTargetSuccessState || state is HomeDeleteTargetSuccessState ){
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
                'Target Graph',
                style: Styles.textStyle24.copyWith(
                    color: AppColor.wihteColor, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: Form(
              key: formKey,
              child: Column(
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
                                targetModel.targetName!,
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
                                'You have achieved the goal',
                                style: Styles.textStyle20
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CircularPercentIndicator(
                                radius: MediaQuery.of(context).size.width / 3,
                                lineWidth: 25.0,
                                animation: true,
                                animationDuration: 1000,
                                percent: targetPercent,
                                center: Text(
                                  '${(targetPercent * 100).round()}%',
                                  style: Styles.textStyle64.copyWith(
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: AppColor.primaryColor,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Center(
                                                    child: Text(
                                                      "Edit Target",
                                                      style: Styles.textStyle20,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  SeperatedLine(),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  defaultFormField(
                                                      autoFocus: false,
                                                      controller:
                                                          nameCtController,
                                                      validate: (e) {
                                                        if (nameCtController
                                                            .text.isEmpty) {
                                                          return 'Target name can not be empty';
                                                        }
                                                        return null;
                                                      },
                                                      type: TextInputType.name,
                                                      label:
                                                          'Enter target name',
                                                      context: context),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  defaultFormField(
                                                      autoFocus: false,
                                                      controller:
                                                          amountController,
                                                      validate: (e) {
                                                        if (amountController
                                                                .text.isEmpty ||
                                                            int.parse(
                                                                    amountController
                                                                        .text) <=
                                                                0) {
                                                          return 'Amount can not be empty';
                                                        }
                                                        return null;
                                                      },
                                                      type:
                                                          TextInputType.number,
                                                      label: 'Enter amount',
                                                      suffixWidget: Text(
                                                        'SAR',
                                                        style: Styles
                                                            .semiBoldTextStyle14
                                                            .copyWith(
                                                                color: AppColor
                                                                    .grayColor),
                                                      ),
                                                      context: context),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  defaultFormField(
                                                      autoFocus: false,
                                                      controller:
                                                          monthController,
                                                      validate: (e) {
                                                        if (monthController
                                                                .text.isEmpty ||
                                                            int.parse(
                                                                    monthController
                                                                        .text) <=
                                                                0) {
                                                          return 'Timeframe can not be empty';
                                                        }
                                                        return null;
                                                      },
                                                      type:
                                                          TextInputType.number,
                                                      label:
                                                          'Enter number of months',
                                                      suffixWidget: Text(
                                                        'Month',
                                                        style: Styles
                                                            .semiBoldTextStyle14
                                                            .copyWith(
                                                                color: AppColor
                                                                    .grayColor),
                                                      ),
                                                      context: context),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Center(
                                                    child: CustomButton(
                                                      onPressed: () {
                                                        if (formKey
                                                            .currentState!
                                                            .validate()) {
                                                          cubit.editTarget(
                                                              double.parse(
                                                                  amountController
                                                                      .text),
                                                              int.parse(
                                                                  monthController
                                                                      .text),
                                                              targetModel
                                                                  .numOfDay!,
                                                              nameCtController
                                                                  .text,
                                                              targetModel
                                                                  .targetId!);
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      },
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4,
                                                      text: 'Save',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    text: 'Edit',
                                    isLoading:
                                        state is HomeEditTargetLoadingState,
                                    width:
                                        (MediaQuery.of(context).size.width) / 4,
                                    color: AppColor.greenColor,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  CustomButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Center(
                                                    child: Text(
                                                      "Are you sure you want \ndelete target ?!",
                                                      textAlign: TextAlign.center,
                                                      style: Styles.textStyle20,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  SeperatedLine(),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Center(
                                                    child: CustomButton(
                                                      onPressed: () {
                                                        cubit.deleteTarget(
                                                            targetModel
                                                                .targetId!);
                                                        Navigator.pop(context);
                                                      },
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4,
                                                      color: AppColor.redColor,
                                                      text: 'delete',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    text: 'Delete',
                                    width:
                                        (MediaQuery.of(context).size.width) / 4,
                                    color: AppColor.redColor,
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
          ),
        );
      },
    );
  }
}
