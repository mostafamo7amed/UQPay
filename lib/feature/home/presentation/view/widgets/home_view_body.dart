import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:uq_pay/core/utils/app_manager/app_assets.dart';
import 'package:uq_pay/core/utils/app_manager/app_color.dart';
import 'package:uq_pay/feature/home/presentation/view/home_screen.dart';
import 'package:uq_pay/feature/home/presentation/view/cards_screen.dart';
import 'package:uq_pay/feature/home/presentation/view/settings_screen.dart';
import 'package:uq_pay/feature/home/presentation/view/store_screen.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);

    List<Widget> buildScreens() {
      return [HomeScreen(), const CardsScreen(),const StoreScreen(), const SettingsScreen()];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          inactiveIcon:const ImageIcon(
            AssetImage(AssetsData.homeIcon,),
          ),
          icon: const ImageIcon(
             AssetImage(AssetsData.homeIcon,),
          ),
          title: ("Home"),
          activeColorSecondary: AppColor.lightgrayColor,
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: AppColor.grayColor,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: const ImageIcon(
             AssetImage(AssetsData.wellatIcon,),
          ),
          icon: const ImageIcon(
             AssetImage(AssetsData.wellatIcon,),
          ),
          activeColorSecondary: AppColor.lightgrayColor,
          title: ("Cards"),
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: AppColor.grayColor,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon:const ImageIcon(
            AssetImage(AssetsData.cartIcon,),
          ),
          icon: const ImageIcon(
             AssetImage(AssetsData.cartIcon,),
          ),
          title: ("Store"),
          activeColorSecondary: AppColor.lightgrayColor,
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: AppColor.grayColor,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon:const ImageIcon(
            AssetImage(AssetsData.settingIcon,),
          ),
          icon: const ImageIcon(
             AssetImage(AssetsData.settingIcon,),
          ),
          title: ("Setting"),
          activeColorSecondary: AppColor.lightgrayColor,
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
