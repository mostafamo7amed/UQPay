import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/feature/admin/data/category_model.dart';
import 'package:UQPay/feature/company/data/company_model.dart';
import 'package:flutter/material.dart';

class StoreAndCategoryItem extends StatelessWidget {
  const StoreAndCategoryItem({
    super.key,
    required this.widthRate,
    required this.heightRate,
    this.categoryModel,
    this.companyModel,
    this.isGrid = false,
  });

  final double widthRate;
  final double heightRate;
  final CategoryModel? categoryModel;
  final CompanyModel? companyModel;
  final bool isGrid;

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
            top: 1,
            child: Container(
              height: MediaQuery.of(context).size.width / heightRate,
              width: (MediaQuery.of(context).size.width - 20) / widthRate,
              decoration: BoxDecoration(
                  color: AppColor.wihteColor,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: categoryModel != null
                      ? NetworkImage(categoryModel!.image.toString())
                      : NetworkImage(companyModel!.image.toString()),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(3),
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
                  ? categoryModel!.name!
                  : companyModel!.name!,
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
