import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_state.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/save_account/defualt_form.dart';
import 'package:UQPay/feature/store/data/models/store_model.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/store_details_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/store_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class StoresView extends StatelessWidget {
  const StoresView({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

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
            categoryName,
            style: Styles.textStyle24.copyWith(
                color: AppColor.blackColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            var cubit = HomeCubit.getCubit(context);
            return  cubit.allCertainCateCompany.isNotEmpty?
              Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: cubit.allCertainCateCompany.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // navigate to details exercises
                          cubit.getCertainCompanyProduct(cubit.allCertainCateCompany[index].uid!);
                           PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: StoreDetailsView(
                          companyModel: cubit.allCertainCateCompany[index],
                        ),
                      );
                        },
                        child: StoreAndCategoryItem(
                      isGrid: true,
                      companyModel: cubit.allCertainCateCompany[index],
                      widthRate: 2,
                      heightRate: 2.9,
                    ),
                      );
                    },
                  ),
                )
              ],
            ): const Center(child: Text('Stores of this category not found',style: Styles.textStyle18,),);
          },
        ),
      ),
    );
  }
}
