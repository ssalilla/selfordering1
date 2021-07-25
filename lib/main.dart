import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selfordering1/CartProvider.dart';

import 'clickMe.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartProvider>(
      create: (c) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: clickMe(),
      ),
    );
  }
}
