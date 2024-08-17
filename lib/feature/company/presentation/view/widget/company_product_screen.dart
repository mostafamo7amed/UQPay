import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:UQPay/feature/company/data/product_model.dart';
import 'package:UQPay/feature/company/presentation/manager/company_cubit.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_add_product_view.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_view_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CompanyProductScreen extends StatelessWidget {
  const CompanyProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyState>(
  listener: (context, state) {
    if(state is UpdateProductStatusSuccessState){
      CompanyCubit.getCubit(context).getCompanyProducts();
    }
  },
  builder: (context, state) {
    var cubit =CompanyCubit.getCubit(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: Text(
            'Products',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          leading: InkWell(
              onTap: () {
                PersistentNavBarNavigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.wihteColor,
              )),
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(context,
                screen: CompanyAddProductView());
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                shape: BoxShape.rectangle,
                color: AppColor.primaryColor),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: AppColor.wihteColor,
                    size: 28,
                  ),
                  Text(
                    'Add',
                    style:
                        Styles.textStyle20.copyWith(color: AppColor.wihteColor),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.backgroundColor,
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(24),
                      topEnd: Radius.circular(24)),
                ),
                child:cubit.allProducts.isNotEmpty ?
                ListView.builder(
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      /*PersistentNavBarNavigator.pushNewScreen(context,
                          screen: CompanyViewProductView(productModel:cubit.allProducts[index] ,));*/
                    },
                    child: CompanyProductItem(productModel: cubit.allProducts[index],),
                  ),
                  itemCount: cubit.allProducts.length,
                ):
                const Center(child: Text('There is no products yet',style: Styles.textStyle18,),),
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

class CompanyProductItem extends StatelessWidget {
  const CompanyProductItem({
    super.key,
    required this.productModel
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.wihteColor,
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15,left: 15,right: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width / 4.3,
                  height: MediaQuery.of(context).size.width / 4.3,
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: productModel.image!=''?
                        NetworkImage(productModel.image!)
                            : const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxw2zmO4oHZBX0PUSZd_nD6IAl203sdkzxCw&s'),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      productModel.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20
                          .copyWith(color: AppColor.blackColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        right: 20,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Amount',
                            style: Styles.regularTextStyle16
                                .copyWith(color: AppColor.blackColor),
                          ),
                          const Spacer(),
                          Text(
                            '${productModel.amount} SAR',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.regularTextStyle16
                                .copyWith(color: AppColor.grayColor),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5, right: 20,),
                      child: Row(
                        children: [
                          Text(
                            'Product type',
                            style: Styles.regularTextStyle16
                                .copyWith(color: AppColor.blackColor),
                          ),
                          const Spacer(),
                          Text(
                            productModel.productType!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.regularTextStyle16
                                .copyWith(color: AppColor.grayColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding:
            const EdgeInsets.only(top: 5, right: 15,left: 15, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: Styles.regularTextStyle16
                      .copyWith(color: AppColor.blackColor),
                ),
                const SizedBox(height: 5,),
                Text(
                  productModel.description!,
                  style: Styles.regularTextStyle16
                      .copyWith(color: AppColor.grayColor),
                ),
              ],
            ),
          ),
          SeperatedLine(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              productModel.status==true? CustomButton(
                onPressed: () {
                  CompanyCubit.getCubit(context).changeProductStatus(productModel, false);
                },
                color: AppColor.wihteColor,
                textColor: AppColor.yellowColor,
                text: 'Hide',
                width: MediaQuery.of(context).size.width / 3,
              ):
              CustomButton(
                onPressed: () {
                  CompanyCubit.getCubit(context).changeProductStatus(productModel, true);
                },
                color: AppColor.wihteColor,
                textColor: AppColor.yellowColor,
                text: 'unHide',
                width: MediaQuery.of(context).size.width / 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
