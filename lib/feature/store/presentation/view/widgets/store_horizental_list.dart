import 'package:UQPay/feature/store/data/models/store_model.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/store_details_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/store_item.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HorizentalListStore extends StatelessWidget {
  const HorizentalListStore({
    super.key,
    required this.widthRate,
    required this.heightRate,
    required this.storeList,
  });
  final double widthRate;
  final double heightRate;
  final List<StoreModel> storeList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / heightRate,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: storeList.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(context,
                screen: StoreDetailsView(products: storeList[index].products,storeName: storeList[index].storeName,));
          },
          child: StoreAndCategoryItem(
              widthRate: widthRate, storeModel: storeList[index]),
        ),
      ),
    );
  }
}
