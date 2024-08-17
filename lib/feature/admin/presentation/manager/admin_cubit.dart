import 'dart:io';
import 'package:UQPay/core/functions/get_random_number.dart';
import 'package:UQPay/feature/admin/data/admin_model.dart';
import 'package:UQPay/feature/admin/data/category_model.dart';
import 'package:UQPay/feature/admin/data/machine_position_model.dart';
import 'package:UQPay/feature/company/data/company_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/functions/toast.dart';
import '../../../../core/utils/app_manager/app_color.dart';
import '../../../../core/utils/common.dart';
import '../../../home/data/models/notification.dart';
import '../../../home/data/models/user_model.dart';
part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  static AdminCubit getCubit(context) => BlocProvider.of(context);


  AdminModel? adminModel;
  void getAdmin(String uid) {
    emit(GetAdminLoading());
    FirebaseFirestore.instance.collection('Admins').doc(uid).get().then((value) {
      adminModel = AdminModel.fromMap(value.data()!);
      print(adminModel!.email);
      emit(GetAdminSuccessState());
    }).catchError((e) {
      emit(GetAdminErrorState());
    });
  }
// use the returned token to send messages to users from your custom server
  String? token;
  getAdminNotificationToken() async{
    token =  await FirebaseMessaging.instance.getToken();
    print(token);
    updateAdminNotificationToken(adminModel!, token!);
  }
  updateAdminNotificationToken(AdminModel user, String token) {
    AdminModel adminModel = AdminModel(
        user.email,
        user.name,
        user.id,
        user.image,
        token,
        user.userType,
        user.birthDate,
        user.gender,
        user.uid,
        user.mobileNumber,
    );
    FirebaseFirestore.instance
        .collection('Admins')
        .doc(user.uid)
        .update(adminModel.toMap()!)
        .then((value) {
      emit(UpdateAdminTokenSuccessState());
    })
        .catchError((e) {
      emit(UpdateAdminTokenErrorState());
    });
  }
  String? companyCategory;
  selectCategory(String category){
    companyCategory = category;
    emit(SelectCategoryState());
  }

  var picker = ImagePicker();
  File? companyImage;
  Future<void> getCompanyImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      companyImage = File(pickedFile.path);
      emit(PikCompanyImageSuccessState());
      uploadCompanyImage();

    } else {
      print('no image selected');
      emit(PikCompanyImageErrorState());
    }
  }

  String companyImageUri = '';
  uploadCompanyImage() {
    FirebaseStorage.instance
        .ref()
        .child('company/images/${Uri.file(companyImage!.path).pathSegments.last}')
        .putFile(companyImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        companyImageUri = value;
        emit(UploadCompanyImageSuccessState());
      }).catchError((e) {
        emit(UploadCompanyImageErrorState());
      });
    }).catchError((error) {
      emit(UploadCompanyImageErrorState());
      print(error.toString());
    });
  }

  File? categoryImage;
  Future<void> getCategoryImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      categoryImage = File(pickedFile.path);
      uploadCategoryImage();
      emit(PikCategoryImageSuccessState());

    } else {
      print('no image selected');
      emit(PikCategoryImageErrorState());
    }
  }

  String categoryImageUri = '';
  uploadCategoryImage() {
    FirebaseStorage.instance
        .ref()
        .child('category/images/${Uri.file(categoryImage!.path).pathSegments.last}')
        .putFile(categoryImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        categoryImageUri = value;
        emit(UploadCategoryImageSuccessState());
      }).catchError((e) {
        emit(UploadCategoryImageErrorState());
      });
    }).catchError((error) {
      emit(UploadCategoryImageErrorState());
      print(error.toString());
    });
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
    emit(ObscureChangedState());
  }

  registerCompany(String name, String phone ,String category,String image,String email, String password,address,String supported){
    emit(RegisterCompanyLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
          emit(RegisterCompanySuccessState());
      addCompany(name, phone, category, image, email, password, value.user!.uid,address,supported);
    }).catchError((error) {
      emit(RegisterCompanyErrorState());
      toast(message: error.toString(), data: ToastStates.error);
    });


  }


  addCompany(String name, String phone ,String category,String image,String email, String password,String uid,String address,String supported){
    int id = getRandomNumber();
    CompanyModel model = CompanyModel(email, name, password, '$id', image, '', 'Company', uid, phone, category,supported,0.0,address,0.0,0.0);
    FirebaseFirestore.instance
        .collection('Company')
        .doc(uid)
        .set(model.toMap()!)
        .then((value) {
          emit(AddCompanySuccessState());
          toast(message: 'Company added successfully', data: ToastStates.success);
    })
        .catchError((e) {
          emit(AddCompanyErrorState());
    });
  }
   adminLogin(String email,String password){
     FirebaseAuth.instance
         .signInWithEmailAndPassword(email: email, password: password)
         .then((value) {
           print(value.user!.uid);
       emit(ReLoginSuccessState(value.user!.uid));
     }).catchError((error) {
       emit(ReLoginErrorState());
       toast(message: error.toString(), data: ToastStates.error);
     });
   }


  addCategory(String name, String image){
    int id = getRandomNumber();
    CategoryModel model =CategoryModel(name, '$id', image);
    FirebaseFirestore.instance
        .collection('Category')
        .doc('$id')
        .set(model.toMap()!)
        .then((value) {
      emit(AddCategorySuccessState());
      toast(message: 'Category added successfully', data: ToastStates.success);
    })
        .catchError((e) {
      emit(AddCompanyErrorState());
    });
  }

  List<CategoryModel> allCategory =[];
  getAllCategory(){
    allCategory =[];
    FirebaseFirestore.instance
        .collection('Category')
        .get()
        .then((value) {
      for (var element in value.docs) {
        allCategory.add(CategoryModel.fromMap(element.data()));
      }
      emit(GetCategorySuccessState());
    })
        .catchError((e) {
          print(e.toString());
      emit(GetCategoryErrorState());
    });
  }



   List<CompanyModel> allCompany =[];
  List<CompanyModel> allStudentCompany =[];
  List<CompanyModel> allAcademicCompany =[];
  getAllCompany(){
    allCompany =[];
    allStudentCompany =[];
    allAcademicCompany =[];
    FirebaseFirestore.instance
        .collection('Company')
        .get()
        .then((value) {
      for (var element in value.docs) {
        CompanyModel company = CompanyModel.fromMap(element.data());
        if(company.supportType=='Student'){
          allStudentCompany.add(CompanyModel.fromMap(element.data()));
        }else if (company.supportType=='Academic'){
          allAcademicCompany.add(CompanyModel.fromMap(element.data()));
        }
        allCompany.add(CompanyModel.fromMap(element.data()));
      }
      emit(GetCompanySuccessState());
    })
        .catchError((e) {
      emit(GetCompanyErrorState());
    });
  }

  List<UserModel> allStudent = [];
  List<UserModel> allEmployee = [];
  List<UserModel> allUsers = [];
  getAllUsers() {
    allStudent = [];
    allEmployee = [];
    allUsers = [];
    FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((value) {
      for (var element in value.docs) {
        UserModel user =UserModel.fromMap(element.data());
        if(user.userType == 'Student'){
          allStudent.add(UserModel.fromMap(element.data()));
        }else if(user.userType == 'Academic') {
          allEmployee.add(UserModel.fromMap(element.data()));
        }
        allUsers.add(UserModel.fromMap(element.data()));
      }
      emit(GetAllUsersSuccessState());
    }).catchError((e) {
      emit(GetAllUsersErrorState());
    });
  }

  UserModel? selectedUserToRecharge;
  changeSelectedTransferUser(String id , int type) {
    emit(SelectUserToRechargeLoadingState());
    selectedUserToRecharge = UserModel('', '', '', '', '', '', '', 0, '', '', '', '', '', 0);
    if(type == 0){
      allEmployee.forEach((user){
        if(id.contains(user.id!) ){
          selectedUserToRecharge = user;
          emit(SelectUserToRechargeState());
        }
      });
      if(selectedUserToRecharge!.uid==''){
        toast(message: 'User not found', data: ToastStates.warning);
      }
    }else{
      allStudent.forEach((user){
        if(id.contains(user.id!) ){
          selectedUserToRecharge = user;
          emit(SelectUserToRechargeState());
        }
      });
      if(selectedUserToRecharge!.uid==''){
        toast(message: 'User not found', data: ToastStates.warning);
      }
    }
  }


  updateUserMoney(UserModel user, double amount,) {
    emit(UpdateMoneyLoadingState());
    double newAmount = user.cardAmount! + amount;
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
      emit(UpdateMoneySuccessState());
    })
        .catchError((e) {
      emit(UpdateMoneyErrorState());
    });
  }

  addDepositMachine(String name, String long,String lat){
    emit(AddMachineLoadingState());
    int id = getRandomNumber();
    MachinePositionModel model = MachinePositionModel(name, '$id', lat, long);
    FirebaseFirestore.instance
        .collection('Deposit Machines')
        .doc('$id')
        .set(model.toMap()!)
        .then((value) {
      emit(AddMachineSuccessState());
    })
        .catchError((e) {
      emit(AddMachineErrorState());
    });
  }


  List<NotificationModel> allNotification=[];
  getNotificationDB(){
    allNotification =[];
    FirebaseFirestore.instance
        .collection('Notification')
        .doc(uid)
        .collection('User notification')
        .get()
        .then((value) {
      for (var element in value.docs) {
        allNotification.add(NotificationModel.fromMap(element.data()));
      }
      emit(GetNotificationSuccessState());
    })
        .catchError((e) {
      emit(GetNotificationErrorState());
    });
  }
}
