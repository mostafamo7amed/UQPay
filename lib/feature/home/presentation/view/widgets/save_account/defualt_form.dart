import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_manager/app_color.dart';
import '../../../../../../core/utils/app_manager/app_styles.dart';


Widget defaultFormField({
  required TextEditingController controller,
  required String label,
  required validate,
  required TextInputType type,
  required context,
  suffixWidget,
  priffixWidget,
  onTap,
  autoFocus,
  onSubmit,
  onChange,
}) =>
    SizedBox(
      height: 60,
      child: TextFormField(
        maxLines: 3,
        autofocus: autoFocus,
        controller: controller,
        onTap: onTap,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        decoration: InputDecoration(
          prefix: priffixWidget,
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
