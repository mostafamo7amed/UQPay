import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/feature/company/data/company_model.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_state.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/make_order_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class StoreDetailsView extends StatelessWidget {
  const StoreDetailsView({super.key, required this.companyModel});

  final CompanyModel companyModel;

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
            companyModel.name!,
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
            return state is GetCertainCompanyProductsLoadingState?
                const Center(child: CircularProgressIndicator(),)
              :cubit.allCertainCompanyProducts.isNotEmpty?
              GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: cubit.allCertainCompanyProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: MakeOrderView(
                            product: cubit.allCertainCompanyProducts[index],
                          companyModel:companyModel,
                        )
                    );
                  },
                  child: ProductItem(
                    isGrid: true,
                    productModel: cubit.allCertainCompanyProducts[index],
                    widthRate: 2,
                  ),
                );
              },
            ):const Center(child: Text('There is no products yet',style: Styles.textStyle18,),);
          },
        ),
      ),
    );
  }
}
