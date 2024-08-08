import 'package:UQPay/core/functions/get_operation_date_now.dart';
import 'package:UQPay/core/functions/get_random_number.dart';
import 'package:UQPay/feature/home/data/models/operation.dart';
import 'package:UQPay/feature/home/data/models/target_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/toast.dart';
import '../../../../../core/utils/common.dart';
import '../../../data/models/user_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit getCubit(context) => BlocProvider.of(context);

  // get user information
  UserModel? userModel;
  void getUser(String uid) {
    emit(HomeGetUserLoadingState());
    FirebaseFirestore.instance.collection('Users').doc(uid).get().then((value) {
      userModel = UserModel.fromMap(value.data()!);
      print(userModel!.email);
      emit(HomeGetUserSuccessState());
    }).catchError((e) {
      emit(HomeGetUserErrorState());
    });
  }

  // save account methods
  double targetAmount = 0;
  calculateTarget(double amount, int numMonth) {
    targetAmount = amount * numMonth;
    emit(HomeCalculateTargetState());
  }

  addNewTarget(double amount, int numMonth, int day, String name) {
    emit(HomeAddTargetLoadingState());
    int targetId = getRandomNumber();
    TargetModel newTarget = TargetModel(
        targetId, numMonth, day, amount, targetAmount, amount, name, false);
    FirebaseFirestore.instance
        .collection('Save Accounts')
        .doc(uid)
        .collection('Targets')
        .doc('$targetId')
        .set(newTarget.toMap()!)
        .then((value) {
      emit(HomeAddTargetSuccessState());
      toast(message: 'Target added successfully', data: ToastStates.success);
    }).catchError((e) {
      emit(HomeAddTargetErrorState());
      toast(message: e.toString(), data: ToastStates.error);
    });
  }

  List<TargetModel> allTargets = [];
  getUserTargets(String uid) {
    allTargets = [];
    emit(HomeGetTargetLoadingState());
    FirebaseFirestore.instance
        .collection('Save Accounts')
        .doc(uid)
        .collection('Targets')
        .get()
        .then((value) {
      for (var element in value.docs) {
        allTargets.add(TargetModel.fromMap(element.data()));
      }
      emit(HomeGetTargetSuccessState());
      //toast(message:'Target added successfully', data: ToastStates.success);
    }).catchError((e) {
      emit(HomeGetTargetErrorState());
      toast(message: e.toString(), data: ToastStates.error);
    });
  }

  // get all users to make transfer
  List<UserModel> allUsers = [];
  getAllUsers() {
    emit(HomeAllGetUserLoadingState());
    allUsers = [];
    FirebaseFirestore.instance
        .collection('Users')
        .where('uid', isNotEqualTo: uid)
        .get()
        .then((value) {
      for (var element in value.docs) {
        allUsers.add(UserModel.fromMap(element.data()));
      }
      emit(HomeAllGetUserSuccessState());
    }).catchError((e) {
      emit(HomeAllGetUserErrorState());
    });
  }

  UserModel? selectedTransferUser;
  changeSelectedTransferUser(UserModel value) {
    selectedTransferUser = value;
    emit(HomeChangeSelectedNameState());
  }
  UserModel? selectedFavTransferUser;
  changeSelectedFavTransferUser(UserModel value) {
    selectedFavTransferUser = value;
    emit(HomeChangeSelectedNameState());
  }

  transferMoney(UserModel user, double amount) {
    emit(HomeTransferLoadingState());
    var operationId = getRandomNumber();
    var operationDate = getOperationDateNow();
    Operation senderOperation = Operation(
        user.name,
        userModel!.name,
        operationId,
        'You transfer money',
        operationDate,
        amount,
        'Send',
        'Transfer');
    Operation receiverOperation = Operation(
        user.name,
        userModel!.name,
        operationId,
        'You received money',
        operationDate,
        amount,
        'Receive',
        'Transfer');

    FirebaseFirestore.instance
        .collection('All Operation')
        .doc(uid)
        .collection('Operation')
        .doc('$operationId')
        .set(senderOperation.toMap()!)
        .then((value) {
          emit(HomeTransferSuccessState());
          updateUserMoney(userModel!, amount, 'send');
    })
        .catchError((e) {
          emit(HomeTransferErrorState());
    });
    FirebaseFirestore.instance
        .collection('All Operation')
        .doc(user.uid)
        .collection('Operation')
        .doc('$operationId')
        .set(receiverOperation.toMap()!)
        .then((value) {
      emit(HomeTransferSuccessState());
      updateUserMoney(user, amount, 'receive');
    })
        .catchError((e) {
          emit(HomeTransferErrorState());
    });
  }
// update user transfer money
  updateUserMoney(UserModel user, double amount, String type) {
    double newAmount;
    if (type == 'send') {
      newAmount = user.cardAmount! - amount;
    } else {
      newAmount = user.cardAmount! + amount;
    }
    UserModel userModel = UserModel(
        user.email,
        user.name,
        user.id,
        user.image,
        user.deviceToken,
        user.cardNumber,
        user.userType,
        newAmount,
        user.birthDate,
        user.gender,
        user.uid,
        user.mobileNumber,
        user.department,
        user.cashBacks);
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .update(userModel.toMap()!)
        .then((value) {
          emit(HomeUpdateMoneySuccessState());
    })
        .catchError((e) {
          emit(HomeUpdateMoneyErrorState());
    });
  }

  String? selectedFavFastTransferUser;
  changeSelectedFastTransferUser(String value){
    selectedFavFastTransferUser = value;
    emit(HomeChangeSelectedFastTransferUserState());
  }
  addUserToFastTransfer(String name){
    emit(HomeAddFastTransferLoadingState());
    UserModel? user;
    for (int i=0;i<allUsers.length;i++){
      if(allUsers[i].name == name){
        user = allUsers[i];
        break;
      }
    }
    FirebaseFirestore.instance
        .collection('Fast Transfer')
        .doc(uid)
        .collection('User Account')
        .doc(user!.uid)
        .set(user.toMap()!)
        .then((value) {
      emit(HomeAddFastTransferSuccessState());
    })
        .catchError((e) {
      emit(HomeAddFastTransferErrorState());
    });
  }
  List<UserModel> allFastTransferUsers =[];
  getFastTransferUsers(){
    allFastTransferUsers =[];
    FirebaseFirestore.instance
        .collection('Fast Transfer')
        .doc(uid)
        .collection('User Account')
        .get()
        .then((value) {
      for (var element in value.docs) {
        allFastTransferUsers.add(UserModel.fromMap(element.data()));
      }
      emit(HomeGetFastTransferSuccessState());
    })
        .catchError((e) {
      emit(HomeGetFastTransferErrorState());
    });
  }
}
