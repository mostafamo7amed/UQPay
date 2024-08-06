class UserModel{
  String? email;
  String? name;
  String? id;
  String? uid;
  String? image;
  String? deviceToken;
  String? cardNumber;
  String? userType;
  double? cardAmount;
  String? birthDate;
  String? gender;
  String? mobileNumber;
  String? department;
  double? cashBacks;

  UserModel(
      this.email,
      this.name,
      this.id,
      this.image,
      this.deviceToken,
      this.cardNumber,
      this.userType,
      this.cardAmount,
      this.birthDate,
      this.gender,
      this.uid,
      this.mobileNumber,
      this.department,
      this.cashBacks);

  UserModel.fromMap(Map<String,dynamic> map){
    id = map['id'];
    uid = map['uid'];
    name = map['name'];
    email = map['email'];
    mobileNumber = map['mobileNumber'];
    image = map['image'];
    birthDate = map['birthDate'];
    gender = map['gender'];
    department = map['department'];
    userType = map['userType'];
    deviceToken = map['deviceToken'];
    cashBacks = map['cashBacks'];
    cardAmount = map['cardAmount'];
    cardNumber = map['cardNumber'];

  }

  Map<String,dynamic>? toMap() {
    return {
      'id': id,
      'name': name,
      'uid':uid,
      'email': email,
      'mobileNumber': mobileNumber,
      'image': image,
      'birthDate': birthDate,
      'gender': gender,
      'department': department,
      'userType': userType,
      'deviceToken': deviceToken,
      'cashBacks': cashBacks,
      'cardAmount': cardAmount,
      'cardNumber': cardNumber
    };
  }

}

