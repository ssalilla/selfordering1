import 'package:flutter/material.dart';
import 'package:selfordering1/Americano.dart';
import 'package:selfordering1/Cappucino.dart';
import 'package:selfordering1/Espresso.dart';
import 'package:selfordering1/Latte.dart';
import 'package:selfordering1/Mocca.dart';
import 'package:selfordering1/clickMe.dart';

class Beverages extends StatefulWidget {
  const Beverages({Key? key}) : super(key: key);

  @override
  _BeveragesState createState() => _BeveragesState();
}

class _BeveragesState extends State<Beverages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {Navigator.push(
              context, MaterialPageRoute(builder: (context) => clickMe(),)
          );},
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
            )),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisCount: 3,
          children: <Widget>[
            Column(
              children: [ Container(
                margin: EdgeInsets.all(50),
                child: GestureDetector(
                    onTap: () {Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Americano(),)
                    );},
                    child: Image.asset('assets/Menu/Americano.png')
                ),
              ),
                Text("Americano \n 120 บาท" , style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.brown),)
              ],
            ),
            Column(
              children: [ Container(
                margin: EdgeInsets.all(50),
                child: GestureDetector(
                    onTap: () {Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Cappucino(),)
                    );},
                    child: Image.asset('assets/Menu/Cappucino.png')
                ),
              ),
                Text("Cappucino \n 160 บาท" , style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.brown),)
              ],
            ),
            Column(
              children: [ Container(
                margin: EdgeInsets.all(50),
                child: GestureDetector(
                    onTap: () {Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Espresso(),)
                    );},
                    child: Image.asset('assets/Menu/Espresso.png')
                ),
              ),
                Text("Espresso \n 180 บาท" , style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.brown),)
              ],
            ),
            Column(
              children: [ Container(
                margin: EdgeInsets.all(50),
                child: GestureDetector(
                    onTap: () {Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Latte(),)
                    );},
                    child: Image.asset('assets/Menu/Latte.png')
                ),
              ),
                Text("Latte \n 160 บาท" , style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.brown),)
              ],
            ),
            Column(
              children: [ Container(
                margin: EdgeInsets.all(50),
                child: GestureDetector(
                    onTap: () {Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Mocca(),)
                    );},
                    child: Image.asset('assets/Menu/Mocca.png')
                ),
              ),
                Text("Mocca \n 180 บาท" , style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.brown),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
