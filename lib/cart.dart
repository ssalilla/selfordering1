import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key, required this.price}) : super(key: key);
  final double price;
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
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
          child: Text(
            "ราคารวม: ${widget.price.toStringAsFixed(0)}",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 50, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
