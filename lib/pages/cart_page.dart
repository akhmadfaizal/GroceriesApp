import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:groceries_app/constants/constants.dart';
import 'package:groceries_app/data/fruit_model.dart';
import 'package:groceries_app/widgets/card_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late FruitModel fruitModel = FruitModel();

  @override
  void initState() {
    super.initState();
    initShared();
  }

  late SharedPreferences preferences;
  Future initShared() async {
    preferences = await SharedPreferences.getInstance();

    final fruitJson = preferences.getString('fruit');
    if (fruitJson == null) return;

    final fruitDecode = FruitModel.fromJson(json.decode(fruitJson));
    setState(() {
      fruitModel = fruitDecode;
    });
  }

  String buahIni = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Product'),
        backgroundColor: greenColor,
      ),
      body: Stack(
        children: [
          Container(
            padding: pagePadding,
            child: ListView(
              children: [
                customCardCart(
                  name: fruitModel.name,
                  price: fruitModel.price,
                  rating: fruitModel.rating ?? 0,
                  count: fruitModel.count ?? 0,
                ),
                // customCardCart(),
                // customCardCart(),
                // customCardCart(),
                // customCardCart(),
                // customCardCart(),
                // customCardCart(),
                // customCardCart(),
                SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
          Positioned(
            left: 24,
            bottom: 24,
            right: 24,
            child: customCardCheckout(),
          )
        ],
      ),
    );
  }
}
