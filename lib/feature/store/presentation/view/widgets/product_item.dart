import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/common.dart';
import '../../../../company/data/product_model.dart';

class ProductItem extends StatelessWidget {
  ProductItem({
    super.key,
    required this.widthRate,
    this.productModel,
    this.isGrid = false,
  });

  final double widthRate;
  ProductModel? productModel;
  bool isGrid;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.wihteColor,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      width: MediaQuery.of(context).size.width / widthRate,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColor.wihteColor,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: productModel!.image != ''
                    ? NetworkImage( productModel!.image.toString())
                    : NetworkImage(noImagePlaceholder),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width / widthRate,
            decoration: BoxDecoration(
                color: isGrid
                    ? AppColor.lightgrayColor.withOpacity(0.4)
                    : AppColor.wihteColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Text(
              productModel!.name!,
              style: Styles.textStyle20.copyWith(color: AppColor.blackColor),
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
