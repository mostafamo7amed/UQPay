import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/save_account/defualt_form.dart';
import 'package:UQPay/feature/store/data/models/product_model.dart';
import 'package:UQPay/feature/store/data/models/store_category_model.dart';
import 'package:UQPay/feature/store/data/models/store_model.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/store_details_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/store_item.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class StoresView extends StatelessWidget {
  StoresView({
    super.key,
    required this.storeCategory,
  });

  var searshController = TextEditingController();
  StoreCategoryModel storeCategory;

  @override
  Widget build(BuildContext context) {
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
            storeCategory.categoryName,
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
                  controller: searshController,
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
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // navigate to details exercises
                      PersistentNavBarNavigator.pushNewScreen(context,
                          screen: StoreDetailsView(
                              model: ProductModel(
                                  productImage: storeCategory.categoryImage,
                                  productName: storeCategory.categoryName)));
                    },
                    child: StoreAndCategoryItem(
                      isGrid: true,
                      storeModel: StoreModel(
                        storeName: 'Fitness Yoga',
                        storeIamge: AssetsData.storeImage,
                        storeCategory: storeCategory,
                        products: [],
                      ),
                      widthRate: 2,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
