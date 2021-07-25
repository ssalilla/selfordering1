import 'package:flutter/cupertino.dart';
import 'package:selfordering1/models/CartItem.dart';

class CartProvider extends ChangeNotifier {
  double total = 0.0;
  List<CartItem> items = [];

  void calcPrice() {
    this.total = this
        .items
        .fold(0, (previousValue, element) => previousValue + element.price);
    notifyListeners();
  }

  void addItem(
      {required String title,
      required double price,
      List<int> options = const [],
      required int size}) {
    int id = this.items.length > 0 ? this.items.last.id + 1 : 1;
    this.items.add(CartItem(
        id: id, title: title, price: price, options: options, size: size));
    this.calcPrice();
  }

  void removeItem(int id) {
    this.items.removeWhere((element) => element.id == id);
    this.calcPrice();
  }
}
