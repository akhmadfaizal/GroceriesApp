import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:groceries_app/constants/constants.dart';
import 'package:groceries_app/data/fruit_model.dart';
import 'package:groceries_app/widgets/button_widgets.dart';
import 'package:groceries_app/widgets/card_widgets.dart';
import 'package:groceries_app/widgets/image_widgets.dart';
import 'package:groceries_app/widgets/widgets.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Tab> myTabs = <Tab>[
    Tab(child: tabLayout('Fruits')),
    Tab(child: tabLayout('Vegetables')),
    Tab(child: tabLayout('Milk')),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
    initShared();
  }

  late SharedPreferences preferences;
  Future initShared() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  String buahIni = '';

  @override
  Widget build(BuildContext context) {
    const dummyList = ['Apple', 'Banana', 'Amaranth', 'Grape', 'Milk'];
    TextEditingController searchController = TextEditingController();

    return SafeArea(
      child: Container(
        padding: pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 24),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Find ',
                        style: TextStyle(color: yellowColor),
                      ),
                      TextSpan(
                          text: 'Fresh Groceries',
                          style: TextStyle(color: greenColor)),
                    ],
                  ),
                ),
                imageProfile(
                    img:
                        'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=775&q=80',
                    radius: 25),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            TextFieldSearch(
              label: "Search Groceries",
              controller: searchController,
              initialList: dummyList,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                prefixIcon: const Icon(
                  Icons.search,
                  color: greenColor,
                ),
                hintText: "Search Groceries",
                hintStyle: const TextStyle(
                  color: searchColor,
                  fontWeight: FontWeight.w700,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: const BorderSide(
                    color: borderColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: const BorderSide(
                    color: greenColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Categories',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              labelPadding: const EdgeInsets.only(
                top: 6.0,
                right: 18.0,
                bottom: 6.0,
              ),
              indicatorColor: Colors.transparent,
              tabs: myTabs,
            ),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView(
                    children: [
                      Text(buahIni),
                      customCard(
                        name: 'Sweet Apple',
                        price: '24.000',
                        img:
                            'https://images.unsplash.com/photo-1568702846914-96b305d2aaeb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTgwOTN8MHwxfHNlYXJjaHwzfHxhcHBsZXxlbnwwfHx8fDE2NDkwNzUzMDI&ixlib=rb-1.2.1&q=80&w=1080',
                        count: 5,
                        rating: 5,
                        onPress: () async {
                          final fruit = FruitModel(
                            name: 'Sweet Apple',
                            price: '25.000',
                            rating: 5,
                            image:
                                'https://images.unsplash.com/photo-1568702846914-96b305d2aaeb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTgwOTN8MHwxfHNlYXJjaHwzfHxhcHBsZXxlbnwwfHx8fDE2NDkwNzUzMDI&ixlib=rb-1.2.1&q=80&w=1080',
                          );
                          final fruitJson = json.encode(fruit.toJson());
                          preferences.setString('fruit', fruitJson);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      customCard(
                          name: 'Sweet Banana',
                          price: '20.000',
                          img:
                              'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTgwOTN8MHwxfHNlYXJjaHw1fHxiYW5hbmF8ZW58MHx8fHwxNjQ5MjI4ODA3&ixlib=rb-1.2.1&q=80&w=1080',
                          count: 3,
                          rating: 3,
                          onPress: () {}),
                      SizedBox(
                        height: 10,
                      ),
                      customCard(
                          name: 'Grape',
                          price: '15.000',
                          img:
                              'https://images.unsplash.com/photo-1525286102393-8bf945cd0649?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTgwOTN8MHwxfHNlYXJjaHwzfHxncmFwZXxlbnwwfHx8fDE2NDkyMjk3MjE&ixlib=rb-1.2.1&q=80&w=1080',
                          count: 4,
                          rating: 4,
                          onPress: () {}),
                    ],
                  ),
                  ListView(
                    children: [
                      customCard(
                          name: 'Amaranth',
                          price: '12.000',
                          img:
                              'https://images.unsplash.com/photo-1594225731998-0998d7ce1f6e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTgwOTN8MHwxfHNlYXJjaHw5fHxBbWFyYW50aCUyMHxlbnwwfHx8fDE2NDkyMjk5Mzg&ixlib=rb-1.2.1&q=80&w=1080',
                          count: 5,
                          rating: 5,
                          onPress: () {}),
                    ],
                  ),
                  ListView(
                    children: [
                      customCard(
                          name: 'Milk',
                          price: '12.000',
                          img:
                              'https://images.unsplash.com/photo-1563636619-e9143da7973b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTgwOTN8MHwxfHNlYXJjaHwxMHx8bWlsa3xlbnwwfHx8fDE2NDkyMzAwMDY&ixlib=rb-1.2.1&q=80&w=1080',
                          count: 5,
                          rating: 5,
                          onPress: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
