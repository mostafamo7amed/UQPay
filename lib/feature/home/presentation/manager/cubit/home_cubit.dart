import 'dart:async';
import 'dart:math';

import 'package:UQPay/feature/home/data/models/target_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../../../core/functions/toast.dart';
import '../../../../../core/utils/common.dart';
import '../../../data/models/user_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit getCubit(context) => BlocProvider.of(context);

  UserModel? userModel;
  void getUser(String uid) {
    emit(HomeGetUserLoadingState());
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data()!);
      print(userModel!.email);
      emit(HomeGetUserSuccessState());
    }).catchError((e) {
      emit(HomeGetUserErrorState());
    });
  }
  double targetAmount=0;
  calculateTarget( double amount , int numMonth){
    targetAmount = amount*numMonth;
    emit(HomeCalculateTargetState());
  }

  addNewTarget(double amount , int numMonth, int day, String name){
    emit(HomeAddTargetLoadingState());
    var rng =  Random();
    var targetId = rng.nextInt(900000) + 100000;
    TargetModel newTarget =TargetModel(targetId, numMonth, day, amount, targetAmount, name, false);
    FirebaseFirestore.instance
        .collection('Save Accounts')
        .doc(uid).collection('Targets').doc('$targetId')
        .set(newTarget.toMap()!)
        .then((value) {
          emit(HomeAddTargetSuccessState());
          toast(message:'Target added successfully', data: ToastStates.success);
    })
        .catchError((e) {
          emit(HomeAddTargetErrorState());
          toast(message: e.toString(), data: ToastStates.error);
    });

  }


}
