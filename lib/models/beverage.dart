import 'package:selfordering1/models/optionGroup.dart';

class Beverage {
  int id;
  String name;
  String img;
  double price;
  List<OptionGroup> optionGroups;

  Beverage({
    required this.id,
    required this.name,
    required this.img,
    required this.price,
    this.optionGroups = const []
  });
}
