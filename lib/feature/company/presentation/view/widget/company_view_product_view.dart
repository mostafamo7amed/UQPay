import 'package:UQPay/core/functions/toast.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/company/data/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../manager/company_cubit.dart';

class CompanyViewProductView extends StatelessWidget {
  const CompanyViewProductView({super.key,required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyState>(
  listener: (context, state) {
    if(state is UpdateProductStatusSuccessState){

    }
  },
  builder: (context, state) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          titleSpacing: 3,
          leading: InkWell(
              onTap: () {
                PersistentNavBarNavigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.wihteColor,
              )),
          title: Text(
            'View Product',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.wihteColor,
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(24),
                      topEnd: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 150,
                          decoration:  BoxDecoration(
                            borderRadius:const BorderRadius.all(
                              Radius.circular(10.0),
                            
                            ),
                            image: DecorationImage(
                              image:productModel.image!=''? NetworkImage(productModel.image!)
                                  : const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxw2zmO4oHZBX0PUSZd_nD6IAl203sdkzxCw&s'),
                              fit: BoxFit.cover,
                            ),
                          
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Product Name',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                              Text(
                                productModel.name!,
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                             
                               const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Amount',
                              style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                              Text(
                                '${productModel.amount} SAR',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                            
                                const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Product type',
                          style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                        Text(
                          productModel.productType!,
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                               const SizedBox(
                          height: 10,
                        ),
                        Text(
                                'Description',
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                              Text(
                                productModel.description!,
                                style: Styles.regularTextStyle16
                                    .copyWith(color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                      ],
                    ),
                  ),
                ),
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
