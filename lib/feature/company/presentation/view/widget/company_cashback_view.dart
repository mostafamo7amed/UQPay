import 'package:UQPay/core/functions/toast.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/company/presentation/manager/company_cubit.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/save_account/defualt_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/utils/common.dart';

class CompanyUpdateCashbackView extends StatelessWidget {
  CompanyUpdateCashbackView({super.key});
  final TextEditingController cashbackController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyState>(
  listener: (context, state) {
    if(state is UpdateCashbackSuccessState){
      toast(message: 'Cashback added successfully', data: ToastStates.success);
      CompanyCubit.getCubit(context).getCompany(uid);
      Navigator.pop(context);
    }
  },
  builder: (context, state) {
    var cubit  = CompanyCubit.getCubit(context);
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
            'Update Cashback',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColor.backgroundColor,
                    borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(24),
                        topEnd: Radius.circular(24)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Update the cashback value on all orders:',
                        style: Styles.textStyle18
                            .copyWith(color: AppColor.grayColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        autoFocus: false,
                        controller: cashbackController,
                        validate: (value) {
                          if(cashbackController.text.isEmpty) {
                            return 'Please enter cashback number';
                          }else{
                            if (int.parse(cashbackController.text) < 0 || int.parse(cashbackController.text) > 100) {
                              return 'Cashback number from 0 to 100';
                            }
                          }
                          return null;

                        },
                        type: TextInputType.number,
                        suffixWidget: Text(
                          '% ',
                          style: Styles.textStyle24
                              .copyWith(color: AppColor.grayColor),
                        ),
                        context: context,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: CustomButton(
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                              cubit.updateCompanyCashback(cubit.companyModel!,double.parse(cashbackController.text) );
                            }
                          },
                          text: 'Add',
                          isLoading: state is UpdateCashbackLoadingState,
                          width: MediaQuery.of(context).size.width / 3,
                        ),
                      )
                    ],
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
