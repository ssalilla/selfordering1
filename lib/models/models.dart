import 'package:flutter/material.dart';

class Beverages {

  int id;
  String name;
  String img;
  double price;
  int qty;

  Beverages({
    required this.id,
    required this.name,
    required this.img,
    required this.price,
    required this.qty,
  }
      );
}

class Products with ChangeNotifier {

  List<Beverages> _beverages = [];

  Products() {
    _beverages = [
      Beverages(
        id: 1,
        qty: 1,
        name: "Americano",
        img: "assets/Menu/Americano.png",
        price: 120,
      ),
      Beverages(
        id: 3,
        qty: 1,
        name: "Cappucino",
        img: "assets/Menu/Cappucino.png",
        price: 160,
      ),
      Beverages(
        id: 2,
        qty: 1,
        name: "Espresso",
        img: "assets/Menu/Espresso.png",
        price: 180,
      ),
      Beverages(
        id: 4,
        qty: 1,
        name: "Latte",
        img: "assets/Menu/Latte.png",
        price: 160,
      ),
      Beverages(
        id: 5,
        qty: 1,
        name: "Mocca",
        img: "assets/Menu/Mocca.png",
        price: 180,
      ),
    ];
  }

  List<Beverages> get beverages => _beverages;

}