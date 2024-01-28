import 'dart:async';

import 'package:ecommerce/controllers/recommended_products_controller.dart';
import 'package:ecommerce/utils/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ecommerce/routes/routes_helper.dart';

import '../../controllers/popular_product_controller.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  Future<void> loadResources()async{
      Get.find<PopularProductController>().getPopularProductList();
      Get.find<Recommended_products_Controller>().getRecommended_products_list();
  }

  @override
  void initState() {
    loadResources();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(Duration(seconds: 5),()=>{
       Get.offNamed(Routes.go_to_home()),
    });
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ScaleTransition(scale: animation,
            child: SvgPicture.asset(
              "images/splash.svg",
              height: dimentions.height160,
            ),
          ),
        ),
      ),
    );
  }
}
