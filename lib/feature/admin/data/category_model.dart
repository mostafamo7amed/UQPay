class CategoryModel{
  String? name;
  String? id;
  String? image;


  CategoryModel(
      this.name,
      this.id,
      this.image,
      );

  CategoryModel.fromMap(Map<String,dynamic> map){
    id = map['id'];
    name = map['name'];
    image = map['image'];

  }

  Map<String,dynamic>? toMap() {
    return {
      'id': id,
      'name': name,
      'image':image,

    };
  }

}

