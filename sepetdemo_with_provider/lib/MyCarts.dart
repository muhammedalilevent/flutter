import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyCart extends ChangeNotifier{

  List<String> _list=[];

  List<String> get list=> _list;

  int _totalPrice=0;

  int get totalPrice=> _totalPrice;

  void addItem(String item){
  _list.add(item);
  _totalPrice+=10;
  notifyListeners();

  }
  void removeItem(String item){
    _list.remove(item);
    _totalPrice-=10;
    notifyListeners();
  }
  void clearCart(){
    _list=[];
    _totalPrice=0;
    notifyListeners();
  }


}