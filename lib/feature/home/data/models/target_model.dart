class TargetModel{
  int? targetId;
  int? numOfMonth;
  int? numOfDay;
  double? amountSave;
  double? targetAmount;
  double? achievedAmount;
  String? targetName;
  bool? isAchieved;

  TargetModel(this.targetId, this.numOfMonth, this.numOfDay, this.amountSave,
      this.targetAmount,this.achievedAmount, this.targetName,this.isAchieved);
  TargetModel.fromMap(Map<String,dynamic> map){
    targetAmount = map['targetAmount'];
    numOfDay = map['numOfDay'];
    numOfMonth = map['numOfMonth'];
    amountSave = map['amountSave'];
    targetId =map['targetId'];
    targetName = map['targetName'];
    achievedAmount = map['achievedAmount'];
    isAchieved = map['isAchieved'];
  }

  Map<String,dynamic>? toMap() {
    return {
      'targetAmount': targetAmount,
      'numOfDay': numOfDay,
      'numOfMonth':numOfMonth,
      'amountSave': amountSave,
      'targetId': targetId,
      'targetName': targetName,
      'isAchieved': isAchieved,
      'achievedAmount':achievedAmount
    };
  }

}