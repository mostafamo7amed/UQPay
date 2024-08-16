class NotificationModel {
  String? title;
  int? notifyId;
  String? message;
  String? dateTime;
  String? notifyType;
  String? image;

  NotificationModel(
      this.notifyId,
      this.title,
      this.message,
      this.dateTime,
      this.notifyType,
      this.image,
      );

  NotificationModel.fromMap(Map<String, dynamic> map) {
    notifyId = map['notifyId'];
    title = map['title'];
    message = map['message'];
    dateTime = map['dateTime'];
    notifyType = map['notifyType'];
    image =map['image'];
  }

  Map<String, dynamic>? toMap() {
    return {
      'notifyId': notifyId,
      'title': title,
      'message': message,
      'dateTime': dateTime,
      'notifyType': notifyType,
      'image':image
    };
  }
}
