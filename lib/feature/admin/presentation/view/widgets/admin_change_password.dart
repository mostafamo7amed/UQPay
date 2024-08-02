import 'package:flutter/material.dart';

import '../../../../../core/utils/app_manager/app_color.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form.dart';

class AdminChangePassword extends StatelessWidget {
  const AdminChangePassword({super.key});

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
        body: Column(
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
                          suffixIcon: InkWell(
                            onTap: () {
                              //cubit.changeObscure();
                            },
                            child: const Icon(Icons.visibility), //cubit.eyeIcon,
                          ),
                          validator: (value) {
                            return;
                          },
                          controller: TextEditingController(),
                        ),
                        const SizedBox(height: 10,),
                        CustomTextField(
                          hintText: 'Enter new password',
                          inputType: TextInputType.name,
                          suffixIcon: InkWell(
                            onTap: () {
                              //cubit.changeObscure();
                            },
                            child: const Icon(Icons.visibility), //cubit.eyeIcon,
                          ),
                          validator: (value) {
                            return;
                          },
                          controller: TextEditingController(),
                        ),
                        const SizedBox(height: 10,),
                        CustomTextField(
                          hintText: 'Confirm password',
                          inputType: TextInputType.name,
                          suffixIcon: InkWell(
                            onTap: () {
                              //cubit.changeObscure();
                            },
                            child: const Icon(Icons.visibility), //cubit.eyeIcon,
                          ),
                          validator: (value) {
                            return;
                          },
                          controller: TextEditingController(),
                        ),
                        const SizedBox(height: 10,),
                        Center(
                          child: CustomButton(
                            onPressed: () {},
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
    );
  }
}
