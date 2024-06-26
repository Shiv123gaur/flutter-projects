import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/screens/Account/Account_info.dart';
import 'package:ecommerce/screens/Home/home_food_page.dart';
import 'package:ecommerce/screens/cart/cart_home.dart';
import 'package:ecommerce/screens/cart/order_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Auth/SingnIn.dart';
import '../Auth/SingnUp.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  int currentPage = 0;
  List pages = [
    HomeFoodPage(),
    Sign_Up_Page(),
    History(),
    Account_Info()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.blue,
        currentIndex: currentPage,
        onTap: (indexx){
          setState(() {
            currentPage = indexx;
          });
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label:"home"),
        BottomNavigationBarItem(icon: Icon(Icons.archive),label: "history"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded),label: "cart"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "me"),
      ],
      ),
    );
  }
}
