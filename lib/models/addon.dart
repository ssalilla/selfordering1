import 'package:flutter/material.dart';

class addonsize {
  int id;
  String size;
  double price;

  addonsize({
    required this.id,
    required this.size,
    required this.price,
  });
}


List<addonsize> listSize = [
  addonsize(
    id: 7,
    size: 'Grande',
    price: 30,
  ),
  addonsize(
    id: 8,
    size: 'Grande',
    price: 30,
  ),
  addonsize(
    id: 9,
    size: 'Venti',
    price: 50,
  ),
];


class addontopping {
  int id;
  String topping;
  double price;
  bool isCheck;

  addontopping({
    required this.id,
    required this.topping,
    required this.price,
    required this.isCheck,
  });
}

List<addontopping> listTopping = [
  addontopping(
    id: 10,
    topping: 'Whipcream',
    price: 0,
    isCheck: true,
  ),
  addontopping(
    id: 11,
    topping: 'Javachip',
    price: 30,
    isCheck: false,
  ),
  addontopping(
    id: 12,
    topping: 'SoyMilk',
    price: 20,
    isCheck: false,
  ),
  addontopping(
    id: 13,
    topping: 'ExtraSyrup',
    price: 30,
    isCheck: false,
  ),
];



