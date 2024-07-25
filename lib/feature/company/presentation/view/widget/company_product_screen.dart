import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_add_offer_view.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_add_product_view.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_view_product_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CompanyProductScreen extends StatelessWidget {
  const CompanyProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(context,
                screen: const CompanyAddProductView());
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
                child: ListView.builder(
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(context,
                          screen: const CompanyViewProductView());
                    },
                    child: const CompanyProductItem(),
                  ),
                  itemCount: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompanyProductItem extends StatelessWidget {
  const CompanyProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.wihteColor,
      elevation: 4,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: MediaQuery.of(context).size.width / 4.3,
                  height: MediaQuery.of(context).size.width / 4.3,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSK_p-3PSabMItwpdqtL9zAy1Hwk2ioosBm3Q&s')),
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
                      'Fitness Gym',
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
                                .copyWith(color: AppColor.grayColor),
                          ),
                          const Spacer(),
                          Text(
                            '240.00 SAR',
                            style: Styles.regularTextStyle16
                                .copyWith(color: AppColor.grayColor),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5, right: 20, bottom: 10),
                      child: Row(
                        children: [
                          Text(
                            'Product type',
                            style: Styles.regularTextStyle16
                                .copyWith(color: AppColor.grayColor),
                          ),
                          const Spacer(),
                          Text(
                            'Service',
                            style: Styles.regularTextStyle16
                                .copyWith(color: AppColor.grayColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SeperatedLine(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onPressed: () {},
                color: AppColor.wihteColor,
                textColor: AppColor.yellowColor,
                text: 'Hide',
                width: MediaQuery.of(context).size.width / 3,
              )
            ],
          ),
        ],
      ),
    );
  }
}
