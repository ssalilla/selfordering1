import 'package:flutter/material.dart';
import 'package:selfordering1/Beverages.dart';

class clickMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Starbuckblur.jpg'),
              fit: BoxFit.fill,
            )
        ),
        child: GestureDetector(
              onTap: () {Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beverages(),)
              );},
              child: Container(
                margin: EdgeInsets.all(100),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('Beverages', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 80,
                      color: Colors.red),),
                ),
              ),
        ),
      ),
      );
  }
}
