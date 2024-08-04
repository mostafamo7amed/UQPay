import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../../core/utils/app_manager/app_color.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';

class CompanyViewOffersView extends StatelessWidget {
  const CompanyViewOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
              'View offer',
              style: Styles.textStyle24.copyWith(
                  color: AppColor.wihteColor, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Container(
            decoration: const BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpg0ddGu4guMHQZhktsiywY1UWF4Roh4txInG5GBR5HPQ-TnsNNiBMA5yJ8gYha0xixkQ&usqp=CAU')),
            ),
          ),
    ),
    );
  }
}
