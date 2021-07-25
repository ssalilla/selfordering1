import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selfordering1/CartProvider.dart';

import 'models/data.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  String _getSize(int size) {
    return Data.commonOptions.last.options
        .firstWhere((element) => element.id == size)
        .title;
  }

  String _getOptions(List<int> options) {
    List<String> str = [];
    Data.commonOptions.first.options.forEach((element) {
      if (options.contains(element.id)) {
        str.add(element.title);
      }
    });
    return str.length == 0 ? "NA" : str.join("/");
  }

  @override
  Widget build(BuildContext context) {
    final total = context.watch<CartProvider>().total;
    final items = context.watch<CartProvider>().items;
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/lightwood.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(items.length, (index) {
              final item = items[index];
              return ListTile(
                title: Row(
                  children: [
                    Text(item.title),
                    Text(item.price.toStringAsFixed(0)),
                    Text(" Size : ${this._getSize(item.size)}   "),
                    Text(" Options : ${this._getOptions(item.options)}   "),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CartProvider>().removeItem(item.id);
                        },
                        child: Text("Remove"))
                  ],
                ),
              );
            }),
            Text("total : ${total.toStringAsFixed(0)}")
          ],
        )),
      ),
    );
  }
}
