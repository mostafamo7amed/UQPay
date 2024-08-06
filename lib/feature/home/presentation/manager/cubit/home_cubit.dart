import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

}
