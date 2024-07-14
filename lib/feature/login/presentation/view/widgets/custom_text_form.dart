
import 'package:flutter/material.dart';
import 'package:uq_pay/core/utils/app_manager/app_color.dart';
import 'package:uq_pay/core/utils/app_manager/app_styles.dart';

class CustomTextField extends StatelessWidget {
   const CustomTextField({
    super.key,this.hintText,this.inputType,this.suffixIcon,this.isObscureText = false,required this.controller,this.validator
  });
   final String? hintText;
   final Widget? suffixIcon;
   final bool isObscureText;
   final TextInputType? inputType;
   final TextEditingController controller;
   final String? Function(String?)? validator;


   @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      keyboardType: inputType,
      controller: controller,
      obscureText: isObscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColor.wihteColor,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 17),
        hintStyle: Styles.regularTextStyle16.copyWith(color: AppColor.blackColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.greenColor),
          borderRadius: BorderRadius.circular(16),
        ),
        disabledBorder:OutlineInputBorder(
            borderSide:  BorderSide(color: AppColor.grayColor),
            borderRadius: BorderRadius.circular(16)),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.redColor),
          borderRadius: BorderRadius.circular(16),
        ),
        border: OutlineInputBorder(
            borderSide:  BorderSide(color: AppColor.grayColor),
            borderRadius: BorderRadius.circular(16)),
        
      ),
      validator: validator,

    );
  }
}
