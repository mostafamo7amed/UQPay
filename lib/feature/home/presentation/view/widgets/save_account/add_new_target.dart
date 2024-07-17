import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../../core/utils/app_manager/app_color.dart';
import '../../../../../../core/utils/app_manager/app_styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'defualt_form.dart';
import 'new_target_details.dart';

class AddNewTarget extends StatelessWidget {
  AddNewTarget({super.key});
  var nameController = TextEditingController();
  var numberofmonthController = TextEditingController();

  var numerofdayController = TextEditingController();

  var mounyController = TextEditingController();

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
            'New Target',
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
                          'Enter data please',
                          style: Styles.textStyle24
                              .copyWith(color: AppColor.yellowColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            autoFocus: false,
                            controller: nameController,
                            label: ' Target Name ',
                            validate: (value) {},
                            type: TextInputType.name,
                            context: context),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            autoFocus: false,
                            controller: numberofmonthController,
                            label: ' Achievement Timeframe ',
                            validate: (value) {},
                            type: TextInputType.number,
                            suffixWidget: Text(
                              'month',
                              style: Styles.regularTextStyle16
                                  .copyWith(color: AppColor.grayColor),
                            ),
                            context: context),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            autoFocus: false,
                            controller: mounyController,
                            label: ' Monthly savings amount ',
                            validate: (value) {},
                            suffixWidget: Text(
                              'SAR',
                              style: Styles.regularTextStyle16
                                  .copyWith(color: AppColor.grayColor),
                            ),
                            type: TextInputType.number,
                            context: context),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            autoFocus: false,
                            controller: numerofdayController,
                            label: ' Deduction day ',
                            validate: (value) {},
                            type: TextInputType.number,
                            context: context),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          onPressed: () {
                            PersistentNavBarNavigator.pushNewScreen(context,
                                screen: NewTargetDetails());
                          },
                          text: 'Add',
                          width: (MediaQuery.of(context).size.width) / 4,
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
