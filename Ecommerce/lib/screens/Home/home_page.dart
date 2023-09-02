import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/screens/Home/home_food_page.dart';
import 'package:ecommerce/screens/cart/cart_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  int currentPage = 0;
  List pages = [
    HomeFoodPage(),
    Container(child: Center(child: Text("This is the history page"),),),
    Get.find<CartController>().CartTotal<=0?HomeFoodPage():Cart_Home(),
    Container(child: Center(child: Text("This is the profile page"),),)
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
