import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:uq_pay/core/utils/app_manager/app_assets.dart';
import 'package:uq_pay/core/utils/app_manager/app_color.dart';
import 'package:uq_pay/core/utils/app_manager/app_styles.dart';
import 'package:uq_pay/feature/home/presentation/view/widgets/home_screen.dart';
import 'package:uq_pay/feature/card/presentation/view/cards_screen.dart';
import 'package:uq_pay/feature/profile/presentation/view/settings_screen.dart';
import 'package:uq_pay/feature/home/presentation/view/store_screen.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);

    List<Widget> buildScreens() {
      return [const HomeScreen(), const CardsScreen(),const StoreScreen(), const SettingsScreen()];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          inactiveIcon: ImageIcon(
            const AssetImage(AssetsData.homeIcon,),
            color: AppColor.grayColor,
          ),
          icon: ImageIcon(
            color: AppColor.wihteColor,
             const AssetImage(AssetsData.homeIcon,),
          ),
          title: ("Home"),
          textStyle: Styles.regularTextStyle16,
          activeColorSecondary: AppColor.wihteColor,
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: AppColor.grayColor,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon:  ImageIcon(
             const AssetImage(AssetsData.wellatIcon,),
             color: AppColor.grayColor,
          ), 
          icon:  ImageIcon(
             const AssetImage(AssetsData.wellatIcon,),
             color: AppColor.wihteColor,
          ),
          activeColorSecondary: AppColor.wihteColor,
          title: ("Card"),
          textStyle: Styles.regularTextStyle16,
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: AppColor.grayColor,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: ImageIcon(
            const AssetImage(AssetsData.cartIcon,),
            color: AppColor.grayColor,
          ),
          icon:  ImageIcon(
             const AssetImage(AssetsData.cartIcon,),
             color:AppColor.wihteColor,
          ),
          title: ("Store"),
          textStyle: Styles.regularTextStyle16,
          activeColorSecondary: AppColor.wihteColor,
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: AppColor.grayColor,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: ImageIcon(
            const AssetImage(AssetsData.settingIcon,),
            color:  AppColor.grayColor,
          ),
          icon: ImageIcon(
             const AssetImage(AssetsData.settingIcon,),
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
