import 'package:UQPay/core/cache_helper/cache_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:UQPay/core/utils/app_manager/app_assets.dart';
import 'package:UQPay/core/utils/app_manager/app_routes.dart';

import '../../../../../core/utils/common.dart';

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
      if(CacheHelper.getData(key: 'uid')!=null){
        String uId = CacheHelper.getData(key: 'uid');
        uid = uId;
        findUser(uId, context);
      }else{
        GoRouter.of(context).pushReplacement(Routes.loginRoute);
      }
    });
  }

  findUser(String UID,context){
    FirebaseFirestore.instance.collection('Admins').where('uid',isEqualTo: UID).get().then((value) {
      if(value.docs.isNotEmpty){
        GoRouter.of(context)
            .pushReplacement(Routes.adminHomeRoute);
      }else{
        FirebaseFirestore.instance.collection('Users').where('uid',isEqualTo: UID).get().then((value) {
          if(value.docs.isNotEmpty){
            //toast(message: 'User not found', data: ToastStates.warning);
            GoRouter.of(context)
                .pushReplacement(Routes.mainRoute);
          }else{
            FirebaseFirestore.instance.collection('Company').where('uid',isEqualTo: UID).get().then((value) {
              if(value.docs.isNotEmpty){
                GoRouter.of(context)
                    .pushReplacement(Routes.companyRoute);
              }
            }).catchError((e){

            });
          }
        }).catchError((e){

        });
      }
    }).catchError((e){

    });
  }
}
