import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:selfordering1/CartProvider.dart';
import 'package:selfordering1/models/beverage.dart';
import 'package:selfordering1/models/optionGroup.dart';
import 'cart.dart';
import 'models/data.dart';
import 'package:provider/provider.dart';

class BeverageDetails extends StatefulWidget {
  const BeverageDetails({Key? key, required this.beverage}) : super(key: key);
  final Beverage beverage;

  @override
  _BeverageDetailsState createState() => _BeverageDetailsState();
}

class _BeverageDetailsState extends State<BeverageDetails> {
  double price = 0.0;
  List<int> selected = [];
  dynamic sizeValue = Data.commonOptions.last.options.first.id;

  @override
  void initState() {
    this.price = widget.beverage.price;
    super.initState();
  }

  void setPrice() {
    this.price = calcPrice();
    setState(() {});
  }

  double calcPrice() {
    double total = 0;
    widget.beverage.optionGroups.forEach((group) {
      group.options.forEach((option) {
        if (this.selected.contains(option.id) || option.id == sizeValue) {
          total += option.price;
        }
      });
    });

    return widget.beverage.price + total;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CartProvider>().addItem(
              title: widget.beverage.name,
              price: this.price,
              size: this.sizeValue,
              options: this.selected);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("เพิ่มสินค้าลงในตะกร้าสินค้าแล้ว",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white)),
            backgroundColor: Colors.green.shade600,
          ));
        },
        child: Icon(Icons.add_shopping_cart),
      ),
      appBar: AppBar(
        title: Text(''),
        iconTheme: IconThemeData(color: Colors.grey.shade800),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => Cart()));
          }, icon: Icon(Icons.shopping_cart),),
        ],
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
          padding:
              const EdgeInsets.only(top: 100, bottom: 0, left: 100, right: 100),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.beverage.img),
                    ),
                  ),
                ),
                Text(
                  widget.beverage.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.brown),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    this.price.toStringAsFixed(0) + ' บาท',
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
              children:
                  List.generate(widget.beverage.optionGroups.length, (index) {
                final optionGroup = widget.beverage.optionGroups[index];
                return Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: optionGroup.options.length,
                        itemBuilder: (BuildContext context, int i) {
                          final option = optionGroup.options[i];
                          return new Card(
                            child: new Container(
                              padding: new EdgeInsets.all(10.0),
                              child: optionGroup.type ==
                                      OptionGroupType.CHECKBOX
                                  ? CheckboxListTile(
                                      activeColor: Colors.blue,
                                      dense: true,
                                      //font change
                                      title: new Text(
                                        option.price.toStringAsFixed(0) +
                                            ' บาท',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      value: this.selected.contains(option.id),
                                      secondary: Container(
                                        height: 30,
                                        width: 300,
                                        child: Text(
                                          option.title,
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      onChanged: (bool? val) {
                                        if (val == false) {
                                          this.selected.remove(option.id);
                                        } else {
                                          this.selected.add(option.id);
                                        }
                                        setPrice();
                                      },
                                    )
                                  : RadioListTile(
                                      title: Text(option.title),
                                      subtitle: Text(
                                        option.price.toStringAsFixed(0) +
                                            ' บาท',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      value: option.id,
                                      groupValue: sizeValue,
                                      onChanged: (value) {
                                        this.sizeValue = value;
                                        setPrice();
                                      }),
                            ),
                          );
                        }),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
