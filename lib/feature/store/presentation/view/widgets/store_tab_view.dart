import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/store_horizental_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../data/models/store_category_model.dart';

class StoreTabView extends StatelessWidget {
  StoreTabView({super.key});

  final List<StoreCategoryModel> storesList = [
    StoreCategoryModel(categoryName: 'Gym', categoryImage: AssetsData.gymImage),
    StoreCategoryModel(
        categoryName: 'Cafe', categoryImage: AssetsData.cafeImage),
    StoreCategoryModel(
        categoryName: 'Restaurants', categoryImage: AssetsData.restoruntImage),
    StoreCategoryModel(
        categoryName: 'Clinics', categoryImage: AssetsData.clinicImage),
    StoreCategoryModel(
        categoryName: 'Stores', categoryImage: AssetsData.storeImage),
    StoreCategoryModel(
        categoryName: 'Training institutes',
        categoryImage: AssetsData.trainingImage),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Offers",
              style: Styles.textStyle24.copyWith(color: AppColor.yellowColor),
            ),
            const SizedBox(
              height: 10,
            ),
           HorizentalListStores(
              widthRate: 2,
              heightRate: 2.5,
              categoryModel: storesList,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Recommendations",
              style: Styles.textStyle24.copyWith(color: AppColor.yellowColor),
            ),
            const SizedBox(
              height: 10,
            ),
           HorizentalListStores(
              widthRate: 3,
              heightRate: 3,
              categoryModel: storesList,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Select category",
              style: Styles.textStyle24.copyWith(color: AppColor.yellowColor),
            ),
            const SizedBox(
              height: 10,
            ),
           HorizentalListStores(
              widthRate: 3,
              heightRate: 3,
              categoryModel: storesList,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
