import 'package:flutter/material.dart';
import 'package:selfordering1/Americano.dart';
import 'package:selfordering1/Beverages.dart';
import 'package:selfordering1/Cappucino.dart';
import 'package:selfordering1/Espresso.dart';
import 'package:selfordering1/Latte.dart';
import 'package:selfordering1/Mocca.dart';
import 'package:selfordering1/clickMe.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => clickMe(),
      '/beverages': (context) => Beverages(),
      '/Americcano': (context) => Americano(),
      '/Cappucino' : (context) => Cappucino(),
      '/Espresso' : (context) => Espresso(),
      '/Latte' : (context) => Latte(),
      '/Mocca' : (context) => Mocca(),
    },
  ),
  );
}
