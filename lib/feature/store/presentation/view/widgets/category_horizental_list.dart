import 'package:UQPay/feature/admin/data/category_model.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/store_item.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/stores_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HorizontalListCategory extends StatelessWidget {
  const HorizontalListCategory({
    super.key,
    required this.widthRate,
    required this.heightRate,
    required this.categories,
  });
  final double widthRate;
  final double heightRate;
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / heightRate,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            HomeCubit.getCubit(context).getCertainCategoryCompany(categories[index].name!);
            PersistentNavBarNavigator.pushNewScreen(context,
                screen: StoresView(
                  categoryName: categories[index].name!,
                ));
          },
          child: StoreAndCategoryItem(
              widthRate: widthRate, categoryModel: categories[index],
          heightRate: heightRate,),
        ),
      ),
    );
  }
}
