class MachinePositionModel{
  String? name;
  String? id;
  String? longitude;
  String? latitude;

  MachinePositionModel(
      this.name,
      this.id,
      this.latitude,
      this.longitude,
      );

  MachinePositionModel.fromMap(Map<String,dynamic> map){
    id = map['id'];
    name = map['name'];
    longitude = map['longitude'];
    latitude = map['latitude'];

  }

  Map<String,dynamic>? toMap() {
    return {
      'id': id,
      'name': name,
      'latitude':latitude,
      'longitude': longitude,
    };
  }

}

