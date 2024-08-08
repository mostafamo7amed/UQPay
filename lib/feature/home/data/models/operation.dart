class Operation {
  String? senderName;
  String? receiverName;
  int? operationId;
  String? operationName;
  String? date;
  double? operationAmount;
  String? type;
  String? serviceType;

  Operation(
      this.receiverName,
      this.senderName,
      this.operationId,
      this.operationName,
      this.date,
      this.operationAmount,
      this.type,
      this.serviceType);

  Operation.fromMap(Map<String, dynamic> map) {
    receiverName = map['receiverName'];
    senderName = map['senderName'];
    operationId = map['operationId'];
    operationName = map['operationName'];
    date = map['date'];
    operationAmount = map['operationAmount'];
    type = map['type'];
    serviceType = map['serviceType'];
  }

  Map<String, dynamic>? toMap() {
    return {
      'senderName': senderName,
      'receiverName': receiverName,
      'operationId': operationId,
      'operationName': operationName,
      'date': date,
      'operationAmount': operationAmount,
      'type': type,
      'serviceType': serviceType,
    };
  }
}
