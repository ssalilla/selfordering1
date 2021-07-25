import 'package:selfordering1/models/beverage.dart';
import 'package:selfordering1/models/option.dart';
import 'package:selfordering1/models/optionGroup.dart';

class Data {
  static List<OptionGroup> commonOptions = [
    OptionGroup(id: 1, title: "Topping", options: [
      Option(
        id: 1,
        title: 'Whipcream',
        price: 0,
      ),
      Option(
        id: 2,
        title: 'Javachip',
        price: 30,
      ),
      Option(
        id: 3,
        title: 'SoyMilk',
        price: 20,
      ),
      Option(
        id: 4,
        title: 'ExtraSyrup',
        price: 30,
      ),
    ]),
    OptionGroup(id: 2, title: "Size", type: OptionGroupType.RADIO, options: [
      Option(
        id: 5,
        title: 'Tall',
        price: 0,
      ),
      Option(
        id: 6,
        title: 'Grande',
        price: 30,
      ),
      Option(
        id: 7,
        title: 'Venti',
        price: 50,
      ),
    ])
  ];

  static List<Beverage> beverages = [
    Beverage(
        id: 1,
        name: "Americano",
        img: "assets/Menu/Americano.png",
        price: 120,
        optionGroups: commonOptions),
    Beverage(
        id: 3,
        name: "Cappucino",
        img: "assets/Menu/Cappucino.png",
        price: 160,
        optionGroups: commonOptions),
    Beverage(
        id: 2,
        name: "Espresso",
        img: "assets/Menu/Espresso.png",
        price: 180,
        optionGroups: commonOptions),
    Beverage(
        id: 4,
        name: "Latte",
        img: "assets/Menu/Latte.png",
        price: 160,
        optionGroups: commonOptions),
    Beverage(
        id: 5,
        name: "Mocca",
        img: "assets/Menu/Mocca.png",
        price: 180,
        optionGroups: commonOptions),
  ];
}
