class AdminModel{
  String? email;
  String? name;
  String? id;
  String? uid;
  String? image;
  String? deviceToken;
  String? userType;
  String? birthDate;
  String? gender;
  String? mobileNumber;

  AdminModel(
      this.email,
      this.name,
      this.id,
      this.image,
      this.deviceToken,
      this.userType,
      this.birthDate,
      this.gender,
      this.uid,
      this.mobileNumber,
      );

  AdminModel.fromMap(Map<String,dynamic> map){
    id = map['id'];
    uid = map['uid'];
    name = map['name'];
    email = map['email'];
    mobileNumber = map['mobileNumber'];
    image = map['image'];
    birthDate = map['birthDate'];
    gender = map['gender'];
    userType = map['userType'];
    deviceToken = map['deviceToken'];

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
      'userType': userType,
      'deviceToken': deviceToken,
    };
  }

}

