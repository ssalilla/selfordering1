import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selfordering1/CartProvider.dart';
import 'package:selfordering1/Thanks.dart';

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
    return str.length == 0 ? "-" : str.join(" & ");
  }

  @override
  Widget build(BuildContext context) {
    final total = context.watch<CartProvider>().total;
    final items = context.watch<CartProvider>().items;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => Thanks()));
        },
        child: Icon(Icons.payments_sharp, color: Colors.white,),
        backgroundColor: Colors.red,
      ),
      appBar: AppBar(
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey.shade800),
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
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(item.title,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),),
                    Text(item.price.toStringAsFixed(0) + '  บาท',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),),
                    Text(" ขนาด : ${this._getSize(item.size)}   ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),),
                    Text(" ท๊อปปิ้ง : ${this._getOptions(item.options)}   ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(height: 10,),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CartProvider>().removeItem(item.id);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,),
                        child: Text("ลบ"))
                  ],
                ),
              );
            }),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.redAccent),
                      color: Colors.white,
              ),
              child: Text("ราคารวม : ${total.toStringAsFixed(0)}  บาท",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
            ),
          ],
        )),
      ),
    );
  }
}
