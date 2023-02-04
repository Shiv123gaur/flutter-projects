import 'dart:ffi';
import 'dart:math';

class brain{
  brain(this.height,this.weight);
  final int height;
  final int weight;
  double _bmi=0.0;

  String calculate(){
    _bmi = weight/pow((height/100),2);
    return _bmi.toStringAsFixed(1);
  }
  String result(){
    if(_bmi>=25){
      return "Overweight";
    }else if(_bmi>=18){
      return "Normal";
    }else{
      return "Low weight";
    }
  }
  String advice(){
    if(_bmi>=25){
      return "Exercise more and try to loose weight";
    }else if(_bmi>=18){
      return "Your bmi is perfect,keep it up!";
    }else{
      return "Your bmi is too low try to gain some weight";
    }
  }
}