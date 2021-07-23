import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:selfordering1/models/addon.dart';
import 'package:selfordering1/models/models.dart';

class Americano extends StatefulWidget {
  @override
  _AmericanoState createState() => _AmericanoState();
}

class _AmericanoState extends State<Americano> {
  List<Products> beverages = [];
  List<addonsize> listSize = [
    addonsize(
      id: 7,
      size: 'Tall',
      price: 0,
    ),
    addonsize(
      id: 8,
      size: 'Grande',
      price: 30,
    ),
    addonsize(
      id: 9,
      size: 'Venti',
      price: 50,
    ),
  ];
  List<addontopping> listTopping = [
    addontopping(
      id: 8,
      topping: 'Whipcream',
      price: 0,
      isCheck: true,
    ),
    addontopping(
      id: 9,
      topping: 'Javachip',
      price: 30,
      isCheck: false,
    ),
    addontopping(
      id: 10,
      topping: 'SoyMilk',
      price: 20,
      isCheck: false,
    ),
    addontopping(
      id: 11,
      topping: 'ExtraSyrup',
      price: 30,
      isCheck: false,
    ),
  ];
  var items = Products().beverages;

  bool _value = false;

  @override
  var _size;

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
        child: ListView(
          padding: const EdgeInsets.all(100),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(items[1].img),
                    ),
                  ),
                ),
                Text(
                  items[1].name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.brown),
                ),
                Container(
                  margin: EdgeInsets.all(50),
                  child: Text(
                    items[1].price.toStringAsFixed(0) + ' บาท',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.brown),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: listTopping.length,
                    itemBuilder: (BuildContext context, int i) {
                      return new Card(
                        child: new Container(
                          padding: new EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              new CheckboxListTile(
                                activeColor: Colors.blue,
                                dense: true,
                                //font change
                                title: new Text(
                                  listTopping[i].price.toStringAsFixed(0) +
                                      ' บาท',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: listTopping[i].isCheck,
                                secondary: Container(
                                  height: 50,
                                  width: 300,
                                  child: Text(
                                    listTopping[i].topping,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                onChanged: (bool? val) {
                                  itemChange(val!, i);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: listSize.length,
                    itemBuilder: (BuildContext context, int i) {
                      return new Card(
                        child: new Container(
                          padding: new EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              RadioListTile(
                                  title: Text(listSize[i].size),
                                  subtitle: Text(
                                      listSize[i].price.toStringAsFixed(0) +
                                          ' บาท'),
                                  value: listSize[i].price,
                                  groupValue: _size,
                                  onChanged: (value) {
                                    setState(() {
                                      _size = value;
                                    });
                                  }),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void itemChange(bool val, int i) {
    setState(() {
      listTopping[i].isCheck = val;
    });
  }
}
