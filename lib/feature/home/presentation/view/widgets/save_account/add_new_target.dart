import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../../core/utils/app_manager/app_color.dart';
import '../../../../../../core/utils/app_manager/app_styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'defualt_form.dart';
import 'new_target_details.dart';

class AddNewTarget extends StatelessWidget {
  AddNewTarget({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberOfMonthController = TextEditingController();

  final TextEditingController numberOfDayController = TextEditingController();

  final TextEditingController moneyController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
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
            'New Target',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Column(
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
                              controller:nameController ,
                              label: ' Target Name ',
                              validate: (value) {
                                if (nameController.text.isEmpty) {
                                  return 'Target name can not be empty';
                                }
                                return null;
                              },
                              type: TextInputType.name,
                              context: context),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFormField(
                              autoFocus: false,
                              controller: numberOfMonthController,
                              label: ' Achievement Timeframe ',
                              validate: (value) {
                                if (numberOfMonthController.text.isEmpty ||
                                    int.parse(numberOfMonthController.text) <=
                                        0) {
                                  return 'Timeframe can not be empty';
                                }
                                return null;
                              },
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
                              controller: moneyController,
                              label: ' Monthly savings amount ',
                              validate: (value) {
                                if (moneyController.text.isEmpty) {
                                  return 'Amount can not be empty';
                                }else if(int.parse(moneyController.text) <= 0 ||
                                    cubit.userModel!.cardAmount! <= int.parse(moneyController.text)){
                                  return 'Invalid Amount';
                                }
                                return null;
                              },
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
                              controller: numberOfDayController,
                              label: ' Deduction day ',
                              validate: (value) {
                                if (numberOfDayController.text.isEmpty ||
                                    int.parse(numberOfDayController.text) <= 0 ||
                                    int.parse(numberOfDayController.text) >= 30) {
                                  return 'Day can not be empty';
                                }
                                return null;
                              },
                              type: TextInputType.number,
                              context: context),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.calculateTarget(double.parse(moneyController.text), int.parse(numberOfMonthController.text));
                                PersistentNavBarNavigator.pushNewScreen(context,
                                    screen: NewTargetDetails(
                                      amount: double.parse(moneyController.text),
                                      numberOfDays: int.parse(numberOfDayController.text),
                                      numberOfMonths: int.parse(numberOfMonthController.text),
                                      targetName: nameController.text,
                                    ));
                              }
                            },
                            text: 'Continue',
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
      ),
    );
  },
);
  }
}
