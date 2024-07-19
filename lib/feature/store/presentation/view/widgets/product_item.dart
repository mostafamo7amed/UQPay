import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/feature/store/data/models/product_model.dart';
import 'package:UQPay/feature/store/data/models/store_category_model.dart';
import 'package:UQPay/feature/store/data/models/store_model.dart';
import 'package:flutter/material.dart';

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
          Center(
            child: Image.asset(productModel!.productImage),
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
              productModel!.productName,
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
