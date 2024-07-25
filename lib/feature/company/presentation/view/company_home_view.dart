import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_styles.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_home_screen.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_product_screen.dart';
import 'package:UQPay/feature/company/presentation/view/widget/company_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CompanyHomeView extends StatelessWidget {
  const CompanyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);

    List<Widget> buildScreens() {
      return [
        const CompanyHomeScreen(),
        const CompanyProductScreen(),
        const CompanySettingsScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          inactiveIcon: ImageIcon(
            const AssetImage(
              AssetsData.homeIcon,
            ),
            color: AppColor.grayColor,
          ),
          icon: ImageIcon(
            color: AppColor.wihteColor,
            const AssetImage(
              AssetsData.homeIcon,
            ),
          ),
          title: ("Home"),
          textStyle: Styles.regularTextStyle16,
          activeColorSecondary: AppColor.wihteColor,
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: AppColor.grayColor,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: ImageIcon(
            const AssetImage(
              AssetsData.discount,
            ),
            color: AppColor.grayColor,
          ),
          icon: ImageIcon(
            const AssetImage(
              AssetsData.discount,
            ),
            color: AppColor.wihteColor,
          ),
          title: ("Products"),
          textStyle: Styles.regularTextStyle16,
          activeColorSecondary: AppColor.wihteColor,
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: AppColor.grayColor,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: ImageIcon(
            const AssetImage(
              AssetsData.settingIcon,
            ),
            color: AppColor.grayColor,
          ),
          icon: ImageIcon(
            const AssetImage(
              AssetsData.settingIcon,
            ),
            color: AppColor.wihteColor,
          ),
          title: ("Settings"),
          textStyle: Styles.regularTextStyle16,
          activeColorSecondary: AppColor.wihteColor,
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: AppColor.grayColor,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      handleAndroidBackButtonPress: false, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: false, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      padding: const EdgeInsets.all(10),
      backgroundColor: AppColor.wihteColor,
      isVisible: true,
      confineToSafeArea: true,
      navBarHeight: 64,
      navBarStyle:
          NavBarStyle.style7, // Choose the nav bar style with this property
    );
  }
}
