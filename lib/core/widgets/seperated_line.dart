import 'package:flutter/material.dart';
import 'package:uq_pay/core/utils/app_manager/app_color.dart';

class SeperatedLine extends StatelessWidget {
  SeperatedLine({
    super.key,
    this.color,
  });
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 1,
      color: color??AppColor.lightgrayColor,
    );
  }
}
