import 'package:flutter/material.dart';
import 'package:uq_pay/core/utils/app_manager/app_color.dart';
import 'package:uq_pay/core/utils/app_manager/app_routes.dart';

void main() {
  runApp(const UQPay());
}

class UQPay extends StatelessWidget {
  const UQPay({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'UQPay',
      locale: const Locale('en'),
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        useMaterial3: true,
      ),
    );
  }
}

