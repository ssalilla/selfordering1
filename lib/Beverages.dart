import 'package:flutter/material.dart';
import 'package:selfordering1/models/data.dart';
import 'BeverageDetail.dart';
import 'cart.dart';

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
        iconTheme: IconThemeData(color: Colors.grey.shade800),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => Cart()));
          }, icon: Icon(Icons.shopping_bag))
        ],
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
            children: List.generate(Data.beverages.length, (index) {
              final beverage = Data.beverages[index];
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(50),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BeverageDetails(beverage: beverage),
                              ));
                        },
                        child: Image.asset(beverage.img)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BeverageDetails(beverage: beverage),
                          ));
                    },
                    child: Text(
                      "${beverage.name} ${beverage.price.toStringAsFixed(0)} บาท",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.brown),
                    ),
                  )
                ],
              );
            })),
      ),
    );
  }
}
