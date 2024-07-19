import 'package:flutter/material.dart';
import '../../../../../core/utils/app_manager/app_color.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';
import '../../../data/models/store_category_model.dart';

class HorizentalListStores extends StatelessWidget {
  const HorizentalListStores(
      {super.key,
      required this.widthRate,
      required this.heightRate,
      required this.categoryModel});
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
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              color: AppColor.wihteColor,
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          width: MediaQuery.of(context).size.width / widthRate,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Center(child: Image.asset(categoryModel[index].categoryImage)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  categoryModel[index].categoryName,
                  style:
                      Styles.textStyle20.copyWith(color: AppColor.blackColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
