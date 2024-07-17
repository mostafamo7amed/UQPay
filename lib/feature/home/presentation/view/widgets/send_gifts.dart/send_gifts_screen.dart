import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/save_account/defualt_form.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/send_gifts.dart/send_gift_review_screen.dart';

class SendGiftsScreen extends StatelessWidget {
  SendGiftsScreen({super.key});
  var accountControler = TextEditingController();

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
            'Send Gift',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                PersistentNavBarNavigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'cancel',
                  style: Styles.regularTextStyle16
                      .copyWith(color: AppColor.wihteColor),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Send gift to',
                          style: Styles.textStyle24
                              .copyWith(color: AppColor.yellowColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                            autoFocus: true,
                            priffixWidget: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                
                                Icons.search,
                                color: AppColor.grayColor,
                              ),
                            ),
                            controller: accountControler,
                            label: ' Account ',
                            validate: (e) {},
                            type: TextInputType.name,
                            context: context),
                        const SizedBox(
                          height: 20,
                        ),
                       defaultFormField(
                        autoFocus: false,
                            controller: accountControler,
                            label: ' Gift Amount',
                            validate: (e) {},
                            type: TextInputType.number,
                             suffixWidget: Text(
                              'SAR',
                              style: Styles.regularTextStyle16
                                  .copyWith(color: AppColor.grayColor),
                            ),
                            context: context),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                        autoFocus: false,
                            controller: accountControler,
                            label: ' Gift Message',
                            validate: (e) {},
                            type: TextInputType.multiline,
                            context: context),
                        const SizedBox(
                          height: 15,
                        ),
                         defaultFormField(
                        autoFocus: false,
                            controller: accountControler,
                            label: ' Name ',
                            validate: (e) {},
                            type: TextInputType.name,
                            context: context),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomButton(
                          onPressed: () {
                            PersistentNavBarNavigator.pushNewScreen(context,
                                screen: const SendGiftReviewScreen());
                          },
                          text: 'Next',
                          width: (MediaQuery.of(context).size.width) / 3.5,
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
  }
}
