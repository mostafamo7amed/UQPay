import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/core/widgets/custom_button.dart';
import 'package:UQPay/feature/home/presentation/view/widgets/transfer/confirm_transfer.dart';

class FastTransferFavView extends StatelessWidget {
  FastTransferFavView({super.key});

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
            'Fast Transfer Favourite',
            style: Styles.boldTextStyle16.copyWith(color: AppColor.wihteColor),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: AppColor.wihteColor,
              borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(24), topEnd: Radius.circular(24)),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 75,
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
                            child: DropdownSearch<String>(
                              popupProps: const PopupProps.menu(
                                showSelectedItems: true,
                                showSearchBox: true,
                              ),
                              items: const [
                                "Wala",
                                "Ahmed",
                                "Mohamed",
                              ],
                              dropdownDecoratorProps:
                                  const DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent))),
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: CustomButton(
                        onPressed: () {},
                        text: 'Add',
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
