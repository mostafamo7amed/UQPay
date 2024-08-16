import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/feature/admin/data/category_model.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_state.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/save_account/defualt_form.dart';
import 'package:UQPay/feature/store/data/models/store_model.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/product_item.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/store_item.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/stores_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CategoryDetailsView extends StatelessWidget {
  CategoryDetailsView({
    super.key,
    required this.categories,
    required this.categoryName,
  });

  List<CategoryModel> categories;
  String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeCubit.getCubit(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 2,
              backgroundColor: AppColor.backgroundColor,
              titleSpacing: 3,
              leading: InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColor.blackColor,
                  )),
              title: Text(
                categoryName,
                style: Styles.textStyle24.copyWith(
                    color: AppColor.blackColor, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: defaultFormField(
                      controller: TextEditingController(),
                      autoFocus: false,
                      priffixWidget: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.search,
                          color: AppColor.grayColor,
                        ),
                      ),
                      label: ' Search ',
                      validate: (e) {},
                      type: TextInputType.name,
                      context: context),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: categories.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(context,
                              screen: StoresView(categoryName: categoryName));
                        },
                        child: StoreAndCategoryItem(
                          isGrid: true,
                          categoryModel: categories[index],
                          widthRate: 2,
                          heightRate: 2,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
