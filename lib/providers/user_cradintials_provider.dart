import 'package:flutter/material.dart';

class UserCradintialsProvider extends ChangeNotifier{
  String userName = 'Username';
  int weight= 0;
  int height= 0;

  void changeName(String name){
    userName=name;
    notifyListeners();
  }
void changeWeight(int w){
    weight=w;
    notifyListeners();
  }
  void changeHeight(int h){
    height=h;
    notifyListeners();
  }
}