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
      this.height,
      this.overlayColor,
      this.textColor,
      this.isLoading = false});
  final String? text;
  final Color? textColor;
  final double? width;
  final double? height;
  final Color? color;
  final bool? isLoading;
  final Color? overlayColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 56,
      width: width ?? MediaQuery.of(context).size.width,
      child: isLoading!
          ? const Center(
              child: SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  backgroundColor: Colors.white,
                ),
              ),
            )
          : TextButton(
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
              ),
            ),
    );
  }
}
