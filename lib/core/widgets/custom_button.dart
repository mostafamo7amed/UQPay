import 'package:flutter/material.dart';
import 'package:uq_pay/core/utils/app_manager/app_styles.dart';
import '../utils/app_manager/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.text, required this.onPressed, this.width, this.color,this.textColor});
  final String? text;
  final Color? textColor;
  final double? width;
  final Color? color;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: width ?? MediaQuery.of(context).size.width,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: color ?? AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: Text(
            text ?? '',
            style: Styles.boldTextStyle16.copyWith(color: textColor??AppColor.wihteColor),
          )),
    );
  }
}
