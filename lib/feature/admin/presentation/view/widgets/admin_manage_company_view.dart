import 'package:UQPay/core/widgets/seperated_line.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_manager/app_color.dart';
import '../../../../../../core/utils/app_manager/app_styles.dart';

class AdminManageCompanyView extends StatelessWidget {
  const AdminManageCompanyView({super.key});

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
              )),
          title: Text(
            'Manage Company',
            style: Styles.textStyle24.copyWith(
                color: AppColor.wihteColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          onTap: () {},
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
        body: Container(
          margin: const EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColor.wihteColor,
            borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(24), topEnd: Radius.circular(24)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.separated(
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
          ),
        ),
      ),
    );
  }
}
