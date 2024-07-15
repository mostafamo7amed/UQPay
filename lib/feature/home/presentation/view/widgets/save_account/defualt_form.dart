import 'package:flutter/material.dart';
import 'package:uq_pay/core/utils/app_manager/app_color.dart';
import 'package:uq_pay/core/utils/app_manager/app_styles.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required String label,
  required validate,
  required TextInputType type,
  required context,
  suffixWidget,
  onTap,
  onSubmit,
  onChange,
}) =>
    SizedBox(
      height: 60,
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        decoration: InputDecoration(
          suffix: suffixWidget,
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.yellowColor, width: 2.0),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.yellowColor, width: 2.0),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          label: Text(label, style: Styles.textStyle18),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.yellowColor, width: 2.0),
            borderRadius:  const BorderRadius.all(Radius.circular(16)),
          ),
          labelStyle:
              Styles.regularTextStyle16.copyWith(color: AppColor.blackColor),
        ),
        validator: validate,
        keyboardType: type,
        textAlignVertical: TextAlignVertical.top,
      ),
    );
