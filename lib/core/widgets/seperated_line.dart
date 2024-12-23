import 'package:flutter/material.dart';
import '../utils/app_manager/app_color.dart';

class SeparatedLine extends StatelessWidget {
  const SeparatedLine({
    super.key,
    this.color,
  });
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 1,
      color: color ?? AppColor.lightgrayColor,
    );
  }
}
