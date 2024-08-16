import 'dart:math';

int getRandomNumber(){
  var rng = Random();
  var res = rng.nextInt(90000000) + 10000000;
  return res;
}
int getRandomNumber6(){
  var rng = Random();
  var res = rng.nextInt(900000) + 100000;
  return res;
}