import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:UQPay/feature/store/data/models/product_model.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/oder_details_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/pickup_oder_details_view.dart';
import 'package:UQPay/feature/store/presentation/view/widgets/view_order_details.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class OrderLocationView extends StatelessWidget {
  const OrderLocationView({
    super.key,
  });

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
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                color: AppColor.lightgrayColor,
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) => const StoreLocationWidget(),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 2,
                      ),
                  itemCount: 2),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreLocationWidget extends StatelessWidget {
  const StoreLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Center(
                      child: Text(
                        "Order detail",
                        style: Styles.textStyle20,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SeperatedLine(),
                    const SizedBox(
                      height: 5,
                    ),
                    const Center(
                      child: Text(
                        'Order No: 345678',
                        style: Styles.textStyle18,
                      ),
                    ),
                    const Text(
                      'Amount',
                      style: Styles.textStyle18,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.grayColor)),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          '200 SAR',
                          style: Styles.textStyle18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Pickup info:',
                      style: Styles.textStyle18,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(
                          width: 4,
                        ),
                        Text('Makkah - Ash shara’I')
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        Icon(Icons.access_time_rounded),
                        SizedBox(
                          width: 4,
                        ),
                        Text('20 min')
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 3,
                          onPressed: () {},
                          text: 'Change',
                        ),
                        CustomButton(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 3,
                          onPressed: () {
                            PersistentNavBarNavigator.pushNewScreen(context,
                                screen: const OderDetailsView());
                          },
                          text: 'Confirm',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Ash shara’I',
                      style: Styles.regularTextStyle16,
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: AppColor.greenColor.withOpacity(.3),
                      ),
                      child: Text('4 KM'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: AppColor.greenColor.withOpacity(.3),
                      ),
                      child: Text('Open'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(
                      width: 4,
                    ),
                    Text('Makkah - Ash shara’I')
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(
                      width: 4,
                    ),
                    Text('+966562848295')
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Icon(Icons.timer_outlined),
                    SizedBox(
                      width: 4,
                    ),
                    Text('12:00 PM - 01:00 AM')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
