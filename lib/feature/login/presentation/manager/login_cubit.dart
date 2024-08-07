import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';

import '../../../../core/functions/toast.dart';
import '../../../../core/utils/app_manager/app_color.dart';
import '../../../../core/utils/app_manager/app_routes.dart';



part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit getCubit(context) => BlocProvider.of(context);

  Future getLocationPermission() async {

    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }


  bool obscure = true;
  Icon eyeIcon = Icon(
    Icons.visibility_off,
    color: AppColor.blackColor,
  );

  changeObscure() {
    obscure = !obscure;

    eyeIcon = obscure == true
        ? Icon(
      Icons.visibility_off,
      color: AppColor.blackColor,
    )
        : Icon(
      Icons.visibility,
      color: AppColor.blackColor,
    );
    emit(LoginObscureChangedState());
  }

  userLogin({
    required String email,
    required String password,
    required context,
  }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(LoginErrorState());
      toast(message: error.toString(), data: ToastStates.error);
    });
  }

  findUser(String UID,context){
    FirebaseFirestore.instance.collection('Admin').where('uid',isEqualTo: UID).get().then((value) {
      print(value.docs.toString());
      if(value.docs.isNotEmpty){
        GoRouter.of(context)
            .pushReplacement(Routes.adminHomeRoute);
        emit(LoginNavigateState());
      }else{
        FirebaseFirestore.instance.collection('Users').where('uid',isEqualTo: UID).get().then((value) {
          print(value.docs.toString());
          if(value.docs.isNotEmpty){
            GoRouter.of(context)
                .pushReplacement(Routes.mainRoute);
            emit(LoginNavigateState());
          }else{
            FirebaseFirestore.instance.collection('Company').where('uid',isEqualTo: UID).get().then((value) {
              print(value.docs.toString());
              if(value.docs.isNotEmpty){
                GoRouter.of(context)
                    .pushReplacement(Routes.companyRoute);
                emit(LoginNavigateState());
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
