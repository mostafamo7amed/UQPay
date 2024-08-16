import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_state.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/category_horizental_list.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/store_horizental_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreTabView extends StatelessWidget {
  const StoreTabView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit = HomeCubit.getCubit(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Offers",
                  style: Styles.textStyle24.copyWith(
                      color: AppColor.yellowColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                HorizontalListCategory(
                  widthRate: 2,
                  heightRate: 2.5,
                  categories: cubit.allCategory,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Recommendations",
                  style: Styles.textStyle24.copyWith(
                      color: AppColor.yellowColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                HorizontalListStore(
                  widthRate: 3,
                  heightRate: 3,
                  companyModel: cubit.allCompany,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Select category",
                  style: Styles.textStyle24.copyWith(
                      color: AppColor.yellowColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                HorizontalListCategory(
                  widthRate: 3,
                  heightRate: 3,
                  categories: cubit.allCategory,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
