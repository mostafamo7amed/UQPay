import 'package:UQPay/feature/store/presentation/view/widgets/category_details_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/store_details_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/store_item.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/stores_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../data/models/store_category_model.dart';

class HorizentalListCategory extends StatelessWidget {
  const HorizentalListCategory({
    super.key,
    required this.widthRate,
    required this.heightRate,
    required this.categoryModel,
  });
  final double widthRate;
  final double heightRate;
  final List<StoreCategoryModel> categoryModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / heightRate,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(context,
                screen: CategoryDetailsView(
                  categories: categoryModel,
                  categoryName: categoryModel[index].categoryName,
                ));
          },
          child: StoreAndCategoryItem(
              widthRate: widthRate, categoryModel: categoryModel[index]),
        ),
      ),
    );
  }
}
