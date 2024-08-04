import 'package:UQPay/feature/home/presentation/view/widgets/save_account/defualt_form.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/send_gifts.dart/amount_sent_gift_view.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';

import '../../../../../../core/utils/app_manager/app_assets.dart';

class SendGiftsScreen extends StatefulWidget {
  SendGiftsScreen({super.key});

  @override
  State<SendGiftsScreen> createState() => _SendGiftsScreenState();
}

class _SendGiftsScreenState extends State<SendGiftsScreen> {
  var accountControler = TextEditingController();

  List<String> accounts = ['wala', 'noha', 'mariem', 'ahmed'];

  String? selectedName;

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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            autoFocus: false,
                            controller: TextEditingController(),
                            validate: (e) {},
                            type: TextInputType.text,
                            label: 'Search',
                            priffixWidget: const Icon(
                              Icons.search,
                            ),
                            context: context),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)),
                            color: AppColor.lightgrayColor,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                AssetsData.personRounded,
                                height: 56,
                              ),
                              Expanded(
                                child: DropdownButton(
                                    isExpanded: true,
                                    padding: EdgeInsets.all(8),
                                    alignment: Alignment.centerLeft,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: 35,
                                    ),
                                    hint: const Text(
                                      'Select Account',
                                      style: Styles.textStyle18,
                                    ),
                                    value: selectedName,
                                    items: accounts.map((name) {
                                      return DropdownMenuItem(
                                          value: name, child: Text(name));
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedName = value;
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              onPressed: () {
                                PersistentNavBarNavigator.pushNewScreen(context,
                                    screen: const AmountSentGiftView());
                              },
                              text: 'Next',
                              width: (MediaQuery.of(context).size.width) / 3.5,
                            ),
                          ],
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
