import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/models/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit getCubit(context) => BlocProvider.of(context);



  bool pushNotification = true;
  changePushNotification(){
    pushNotification =!pushNotification;
    emit(GetPushNotificationState());
  }

  UserModel? userModel;
  void getUser(String uid) {
    emit(GetProfileLoadingState());
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data()!);
      emit(GetProfileSuccessState());
    }).catchError((e) {
      emit(GetProfileErrorState());
    });
  }
}
