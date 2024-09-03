class NotificationModel {
  String? title;
  int? notifyId;
  String? message;
  String? dateTime;
  String? notifyType;
  String? image;
  bool? isOpened;
  DateTime? createDate;

  NotificationModel(
      this.notifyId,
      this.title,
      this.message,
      this.dateTime,
      this.notifyType,
      this.image,
      this.isOpened,
      this.createDate
      );

  NotificationModel.fromMap(Map<String, dynamic> map) {
    notifyId = map['notifyId'];
    title = map['title'];
    message = map['message'];
    dateTime = map['dateTime'];
    notifyType = map['notifyType'];
    image =map['image'];
    isOpened = map['isOpened'];
  }

  Map<String, dynamic>? toMap() {
    return {
      'notifyId': notifyId,
      'title': title,
      'message': message,
      'dateTime': dateTime,
      'notifyType': notifyType,
      'image':image,
      'isOpened':isOpened,
      'createDate':createDate
    };
  }
}
