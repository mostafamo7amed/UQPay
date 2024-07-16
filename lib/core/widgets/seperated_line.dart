import 'package:flutter/material.dart';
import 'package:uq_pay/core/utils/app_manager/app_color.dart';

class SeperatedLine extends StatelessWidget {
  const SeperatedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 1,
      color: AppColor.lightgrayColor,
    );
  }
}