import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/feature/store/data/models/store_category_model.dart';
import 'package:UQPay/feature/store/data/models/store_model.dart';
import 'package:flutter/material.dart';

class StoreAndCategoryItem extends StatelessWidget {
  StoreAndCategoryItem({
    super.key,
    required this.widthRate,
    this.categoryModel,
    this.storeModel,
    this.isGrid = false,
  });

  final double widthRate;
  StoreCategoryModel? categoryModel;
  StoreModel? storeModel;
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
          Positioned(
            top: 5,
            child: Container(
              width: (MediaQuery.of(context).size.width - 20) / widthRate,
              decoration: BoxDecoration(
                  color: AppColor.wihteColor,
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Image.asset(
                categoryModel != null
                    ? categoryModel!.categoryImage
                    : storeModel!.storeIamge,
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
              categoryModel != null
                  ? categoryModel!.categoryName
                  : storeModel!.storeName,
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
