import 'package:UQPay/core/utils/app_manager/app_routes.dart';
import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:UQPay/feature/admin/presentation/view/widgets/admin_add_company_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../../../core/utils/app_manager/app_color.dart';
import '../../../../../../core/utils/app_manager/app_styles.dart';
import '../../../../../core/utils/app_manager/app_assets.dart';

class AdminManageCompanyScreen extends StatefulWidget {
  const AdminManageCompanyScreen({super.key});

  @override
  State<AdminManageCompanyScreen> createState() =>
      _AdminManageCompanyScreenState();
}

class _AdminManageCompanyScreenState extends State<AdminManageCompanyScreen> {
  List<String> accounts = ['Student', 'Academic', 'Both'];

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
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.wihteColor,
            ),
          ),
          title: Text(
            'Manage Company',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(context,
                screen: AdminAddCompanyScreen());
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    color: AppColor.wihteColor,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        AssetsData.personRounded,
                        height: 56,
                        color: AppColor.blackColor,
                      ),
                      Expanded(
                        child: DropdownButton(
                            underline: const SizedBox(),
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
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.wihteColor,
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(24),
                      topEnd: Radius.circular(24)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'All companies',
                        style: Styles.textStyle17
                            .copyWith(color: AppColor.blackColor,
                          decoration: TextDecoration.underline
                        ),

                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                child: ClipOval(
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.network(
                                    'https://topscommesse.com/wp-content/uploads/2024/04/Betaland-Logo.webp',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Betaland',
                                style: Styles.textStyle20,
                              )
                            ],
                          ),
                        ),
                        separatorBuilder: (context, index) => SeperatedLine(),
                        itemCount: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
