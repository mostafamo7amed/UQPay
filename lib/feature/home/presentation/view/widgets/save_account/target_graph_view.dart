import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/home/data/models/target_model.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/save_account/defualt_form.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';

import '../../../../../../core/widgets/seperated_line.dart';

class TargetGraphView extends StatelessWidget {
  const TargetGraphView({super.key, required this.targetModel, required this.targetPercent});
  final TargetModel targetModel;
  final double targetPercent;


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
            'Target Graph',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
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
                            '${(targetPercent*100).round()}%',
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
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Center(
                                              child: Text(
                                                "Edit Target months",
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
                                                controller: TextEditingController(), 
                                                validate: (e){

                                                },
                                                type: TextInputType.number,
                                                label: 'Enter number of months',
                                                suffixWidget: Text('Month',style: Styles.semiBoldTextStyle14.copyWith(color: AppColor.grayColor),),
                                                context: context),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Center(
                                              child: CustomButton(
                                                onPressed: (){},
                                                width: MediaQuery.of(context).size.width/4,
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
                              width: (MediaQuery.of(context).size.width) / 4,
                              color: AppColor.greenColor,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            CustomButton(
                              onPressed: () {},
                              text: 'Delete',
                              width: (MediaQuery.of(context).size.width) / 4,
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
    );
  }
}


