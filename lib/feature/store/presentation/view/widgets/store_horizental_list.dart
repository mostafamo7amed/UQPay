import 'package:UQPay/feature/company/data/company_model.dart';
import 'package:UQPay/feature/home/presentation/manager/cubit/home_cubit.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/store_details_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/store_item.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HorizontalListStore extends StatelessWidget {
  const HorizontalListStore({
    super.key,
    required this.widthRate,
    required this.heightRate,
    required this.companyModel,
  });
  final double widthRate;
  final double heightRate;
  final List<CompanyModel> companyModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / heightRate,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: companyModel.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            HomeCubit.getCubit(context).getCertainCompanyProduct(companyModel[index].uid!);
            PersistentNavBarNavigator.pushNewScreen(context,
                screen: StoreDetailsView(
                  companyModel: companyModel[index],));
          },
          child: StoreAndCategoryItem(
              widthRate: widthRate, companyModel: companyModel[index],
              heightRate: heightRate,
          ),
        ),
      ),
    );
  }
}
