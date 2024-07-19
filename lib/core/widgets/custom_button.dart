import 'package:flutter/material.dart';
import '../utils/app_manager/app_color.dart';
import '../utils/app_manager/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.text,
      required this.onPressed,
      this.width,
      this.color,
      this.overlayColor,
      this.textColor});
  final String? text;
  final Color? textColor;
  final double? width;
  final Color? color;
  final Color? overlayColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: width ?? MediaQuery.of(context).size.width,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              overlayColor: overlayColor,
              backgroundColor: color ?? AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: Text(
            text ?? '',
            style: Styles.boldTextStyle16
                .copyWith(color: textColor ?? AppColor.wihteColor),
          )),
    );
  }
}
