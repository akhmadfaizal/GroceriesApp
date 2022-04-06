import 'package:flutter/material.dart';
import 'package:groceries_app/constants/constants.dart';
import 'package:groceries_app/data/profile_api.dart';
import 'package:groceries_app/data/profile_model.dart';
import 'package:groceries_app/pages/cart_page.dart';
import 'package:groceries_app/pages/home_page.dart';
import 'package:groceries_app/pages/profile_page.dart';
import 'package:groceries_app/widgets/card_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Groceries App',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: greenColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Container(
//         padding: pagePadding,
//         child: Column(
//           children: [
            
            // customCard(),
            // customCardCart(),
            // customCardCheckout(),
            // customCardProfile(),
      //     ],
      //   ),
      // ),