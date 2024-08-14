class OfferModel {
  int? id;
  String? image;

  OfferModel(
      this.id,
      this.image,
      );

  OfferModel.fromMap(Map<String,dynamic> map){
    id =map['id'];
    image =map['image'];
  }

  Map<String,dynamic>? toMap(){
    return{
      'id':id,
      'image':image,
    };
  }
}