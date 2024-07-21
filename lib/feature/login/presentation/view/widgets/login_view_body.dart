import 'package:UQPay/core/utils/app_manager/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/core/widgets/custom_text_form.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                    return;
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
                  inputType: TextInputType.name,
                  suffixIcon: InkWell(
                    onTap: () {
                      //cubit.changeObscure();
                    },
                    child: Icon(Icons.visibility), //cubit.eyeIcon,
                  ),
                  validator: (value) {
                    return;
                  },
                  controller: _passwordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () {
                    GoRouter.of(context).pushReplacement(Routes.mainRoute);
                  },
                  text: 'Login',
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
