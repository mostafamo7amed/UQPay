import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_add_offer_view.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_view_offers_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CompanyOfferView extends StatelessWidget {
  const CompanyOfferView({super.key});

  @override
  Widget build(BuildContext context) {
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
            'Offers',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(context,
                screen: CompanyAddOfferView());
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                shape: BoxShape.rectangle,
                color: AppColor.primaryColor),
            child: Padding(
              padding: const EdgeInsets.all(15),
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
                  itemBuilder: (context, index) => Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: AppColor.wihteColor,
                    ),
                    child: SizedBox(
                      height: 230,
                      child: Stack(
                        clipBehavior: Clip.hardEdge,
                        alignment: Alignment.center,
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpg0ddGu4guMHQZhktsiywY1UWF4Roh4txInG5GBR5HPQ-TnsNNiBMA5yJ8gYha0xixkQ&usqp=CAU')),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(

                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                color: AppColor.wihteColor.withOpacity(0.7)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomButton(
                                    onPressed: (){
                                      PersistentNavBarNavigator.pushNewScreen(context, screen: const CompanyViewOffersView());
                                    },
                                    height: 50,
                                    text: 'View',
                                  width: MediaQuery.of(context).size.width/4,),
                                  CustomButton(
                                    onPressed: (){},
                                    text: 'Delete',
                                    height: 50,
                                    color: AppColor.redColor,
                                    width: MediaQuery.of(context).size.width/4,
                                  ),

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
