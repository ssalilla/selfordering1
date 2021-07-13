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
    id: 6,
    size: 'Grande',
    price: 30,
  ),
  addonsize(
    id: 7,
    size: 'Venti',
    price: 50,
  ),
];


class addonTopping {
  int id;
  String topping;
  double price;

  addonTopping({
    required this.id,
    required this.topping,
    required this.price,
  });
}

List<addonTopping> listWhip = [
  addonTopping(
    id: 8,
    topping: 'Whipcream',
    price: 0,
  ),
  addonTopping(
    id: 9,
    topping: 'Javachip',
    price: 30,
  ),
  addonTopping(
    id: 10,
    topping: 'SoyMilk',
    price: 20,
  ),
  addonTopping(
    id: 11,
    topping: 'ExtraSyrup',
    price: 30,
  ),
];