import 'package:flutter/material.dart';
import 'package:selfordering1/Beverages.dart';
import 'package:selfordering1/clickMe.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => clickMe(),
      '/beverages': (context) => Beverages(),
    },
  ),
  );
}
