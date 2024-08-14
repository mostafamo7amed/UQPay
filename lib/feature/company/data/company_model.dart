class CompanyModel{
  String? email;
  String? name;
  String? password;
  String? id;
  String? uid;
  String? image;
  String? deviceToken;
  String? type;
  String? supportType;
  String? category;
  String? phone;
  double? cashback;

  CompanyModel(
      this.email,
      this.name,
      this.password,
      this.id,
      this.image,
      this.deviceToken,
      this.type,
      this.uid,
      this.phone,
      this.category,
      this.supportType,
      this.cashback
      );

  CompanyModel.fromMap(Map<String,dynamic> map){
    id = map['id'];
    uid = map['uid'];
    name = map['name'];
    email = map['email'];
    phone = map['phone'];
    image = map['image'];
    type = map['type'];
    deviceToken = map['deviceToken'];
    category = map['category'];
    supportType =map['supportType'];
    cashback = double.parse(map['cashback'].toString());
  }

  Map<String,dynamic>? toMap() {
    return {
      'id': id,
      'name': name,
      'uid': uid,
      'email': email,
      'phone': phone,
      'image': image,
      'category': category,
      'type': type,
      'deviceToken': deviceToken,
      'supportType':supportType,
      'cashback':cashback
    };
  }

}

