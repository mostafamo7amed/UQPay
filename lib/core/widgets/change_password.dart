import 'package:UQPay/core/cache_helper/cache_helper.dart';
import 'package:UQPay/core/functions/toast.dart';
import 'package:UQPay/feature/admin/presentation/manager/admin_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/app_manager/app_color.dart';
import '../utils/app_manager/app_styles.dart';
import 'custom_button.dart';
import 'custom_text_form.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final passController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmController =TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AdminCubit(),
  child: BlocBuilder<AdminCubit, AdminState>(
  builder: (context, state) {
    var cubit = AdminCubit.getCubit(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          titleSpacing: 3,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.wihteColor,
              )),
          title: Text(
            ' Change Password',
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
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          CustomTextField(
                            hintText: 'Enter your password',
                            inputType: TextInputType.name,
                            isObscureText: cubit.obscure,
                            suffixIcon: InkWell(
                              onTap: () {
                                cubit.changeObscure();
                              },
                              child: cubit.eyeIcon, //cubit.eyeIcon,
                            ),
                            validator: (value) {
                              if(passController.text.isEmpty){
                                return 'Enter your password';
                              }
                              return null;
                            },
                            controller: passController,
                          ),
                          const SizedBox(height: 10,),
                          CustomTextField(
                            hintText: 'Enter new password',
                            inputType: TextInputType.name,
                            isObscureText: cubit.obscure,
                            suffixIcon: InkWell(
                              onTap: () {
                                cubit.changeObscure();
                              },
                              child: cubit.eyeIcon, //cubit.eyeIcon,
                            ),
                            validator: (value) {
                              if(newPassController.text.isEmpty){
                                return 'Enter new password';
                              }
                              return null;
                            },
                            controller: newPassController,
                          ),
                          const SizedBox(height: 10,),
                          CustomTextField(
                            hintText: 'Confirm password',
                            inputType: TextInputType.name,
                            isObscureText: cubit.obscure,
                            suffixIcon: InkWell(
                              onTap: () {
                                cubit.changeObscure();
                              },
                              child: cubit.eyeIcon, //cubit.eyeIcon,
                            ),
                            validator: (value) {
                              if(confirmController.text.isEmpty){
                                return 'Enter confirm password';
                              }
                              return null;
                            },
                            controller: confirmController,
                          ),
                          const SizedBox(height: 10,),
                          Center(
                            child: CustomButton(

                              onPressed: () {
                                String password = CacheHelper.getData(key: 'password');
                                String email = CacheHelper.getData(key: 'email');
                                if(formKey.currentState!.validate()){
                                  if(confirmController.text == newPassController.text){
                                    if(password == passController.text){
                                      FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
                                        toast(message: 'Check your mail to reset your password', data: ToastStates.success);
                                      }).catchError((e){
                                        toast(message: e.toString(), data: ToastStates.warning);
                                      });
                                    }
                                  }else{
                                    toast(message: 'Reenter confirm password', data: ToastStates.error);
                                  }

                                }
                              },
                              text: 'Save',
                              width: (MediaQuery.of(context).size.width) / 4,
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
      ),
    );
  },
),
);
  }
}
