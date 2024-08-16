class ProductModel{
  int? id;
  String? name;
  String? image;
  String? productType;
  double? amount;
  String? description;
  bool? status;

  ProductModel(this.id, this.name, this.image, this.productType, this.amount,
      this.description, this.status,);

  ProductModel.fromMap(Map<String,dynamic> map){
    id = map['id'];
    name = map['name'];
    image = map['image'];
    productType = map['productType'];
    amount = map['amount'];
    description = map['description'];
    status = map['status'];
  }
  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'name':name,
      'image':image,
      'productType':productType,
      'amount':amount,
      'description':description,
      'status':status
    };
  }

}