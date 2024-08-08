double calculateTargetPercent(double amountAchieved,double targetAmount){
  double percent;
  double res =(amountAchieved*100)/100;

  percent = res/100;

  int digit = percent.toInt();
  return percent-digit;
}