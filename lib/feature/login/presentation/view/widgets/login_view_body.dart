import 'package:UQPay/core/utils/app_manager/app_routes.dart';
import 'package:UQPay/feature/home/data/models/user_model.dart';
import 'package:UQPay/feature/login/presentation/manager/login_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/core/widgets/custom_text_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/common.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginSuccessState){
          uid = state.uid;
          LoginCubit.getCubit(context).findUser(state.uid, context);
        }
      },
      builder: (context, state) {
       /* UserModel model = UserModel(
          's441002625@uqu.edu.sa',
          'Omer Mohamed',
          '441002625',
          '',
          '',
          '1234567891066234',
          'Student',
          900.0,
          '2005-01-14',
          'Male',
          'wlSdLox28AXu6GecAh78y7V1IGb2',
          '+966472844309',
          'Computer Science',
          0.00,

        );
        FirebaseFirestore.instance
            .collection('Users')
            .doc(model.uid)
            .set(model.toMap()!)
            .then((value) {})
            .catchError((e) {});*/
        var cubit = LoginCubit.getCubit(context);
        return SafeArea(
            child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      AssetsData.uqpay,
                      width: MediaQuery.of(context).size.width,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'User Name',
                      style: Styles.mediumTextStyle16
                          .copyWith(color: AppColor.blackColor),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      hintText: 'Enter Username',
                      inputType: TextInputType.name,
                      validator: (value) {
                        if (!value!.contains('.edu.sa')||value.isEmpty||!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
                          return 'Please enter academic email address ';
                        }
                        return null;
                      },
                      controller: _usernameController,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Password',
                      style: Styles.mediumTextStyle16
                          .copyWith(color: AppColor.blackColor),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      hintText: 'Enter Password',
                      inputType: TextInputType.visiblePassword,
                      isObscureText: cubit.obscure,
                      maxlines: 1,
                      suffixIcon: InkWell(
                        onTap: () {
                          cubit.changeObscure();
                        },
                        child: cubit.eyeIcon, //cubit.eyeIcon,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter correct password';
                        }
                        return null;

                      },
                      controller: _passwordController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          cubit.userLogin(
                              email: _usernameController.text,
                              password:_passwordController.text ,
                              context: context
                          );
                        }
                      },
                      isLoading: state is LoginLoadingState,
                      text: 'Login',
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
      },
    );
  }
}
/*
UserModel model = UserModel(
  's442345678@stu.uqu.edu.sa',
  'Mohamed Ali',
  '442345678',
  'kk',
  '',
  '12345678910234',
  'Student',
  1300.0,
  '2002-02-18',
  'Male',
  '7hcagmClQdfliBaKp2gd0KRyhNT2',
  '+966572844309',
  'Computer Science',

  150.00,

);
FirebaseFirestore.instance
    .collection('Users')
.doc(model.id)
    .update(model.toMap()!)
    .then((value) {})
    .catchError((e) {});
*/
