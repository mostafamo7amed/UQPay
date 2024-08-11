import 'package:UQPay/core/functions/Notification_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:UQPay/core/utils/app_manager/app_color.dart';
import 'package:UQPay/core/utils/app_manager/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/cache_helper/cache_helper.dart';
import 'core/utils/bloc_observer/bloc_observer.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationsHelper().handleBackgroundNotifications();
  Bloc.observer = MyBlocObserver();
  await NotificationsHelper().getAccessToken();
  await CacheHelper.init();
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

