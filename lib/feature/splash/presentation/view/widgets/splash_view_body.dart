import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_routes.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              fit: BoxFit.fill,
              AssetsData.splashImage,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Image.asset(
              AssetsData.appLogo,
              width: MediaQuery.of(context).size.width + 20 / 2,
              height: MediaQuery.of(context).size.width + 20 / 2,
            ),
          ],
        ),
      ),
    );
  }

  void navigateToNextPage() {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).pushReplacement(Routes.loginRoute);
    });
  }
}
