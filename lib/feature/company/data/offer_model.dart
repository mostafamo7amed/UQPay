class OfferModel {
  int? id;
  String? image;
  String? offerType;


  OfferModel(
      this.id,
      this.image,
      this.offerType
      );

  OfferModel.fromMap(Map<String,dynamic> map){
    id =map['id'];
    image =map['image'];
    offerType =map['offerType'];
  }

  Map<String,dynamic>? toMap(){
    return{
      'id':id,
      'image':image,
      'offerType':offerType
    };
  }
}