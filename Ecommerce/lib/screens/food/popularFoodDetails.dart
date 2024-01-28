import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/routes/routes_helper.dart';
import 'package:ecommerce/screens/Home/home_food_page.dart';
import 'package:ecommerce/screens/cart/cart_home.dart';
import 'package:ecommerce/utils/project_constanst.dart';
import 'package:ecommerce/widgets/Big_text.dart';
import 'package:ecommerce/widgets/ExpandableText.dart';
import 'package:ecommerce/widgets/Small_text.dart';
import 'package:ecommerce/widgets/appIcon.dart';
import 'package:ecommerce/widgets/text_icon.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/utils/dimentions.dart';
import 'package:get/get.dart';

class PopularFood_Details extends StatelessWidget {
  PopularFood_Details({Key? key, required this.pageId,required this.page}) : super(key: key);
  final int pageId;
  final String page;

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initiate(Get.find(), product);
    return Scaffold(body: GetBuilder<PopularProductController>(
      builder: (popularproducts) {
        return Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(AppConstants.BASE_URL +
                              "/uploads/" +
                              product.img!))),
                )),
            Positioned(
                left: dimentions.width10,
                top: 50,
                child: GestureDetector(
                  onTap: () {
                    if(page=="cart"){
                      Get.toNamed(Routes.got_to_cartHome(false));

                    }else{
                      Get.toNamed(Routes.go_to_home());
                    }
                  },
                  child: AppIcon(
                      iconbackground: Icons.circle,
                      icontop: Icons.arrow_back_ios_new),
                )),
            Positioned(
                right: dimentions.width10,
                top: 50,
                child: Get.find<PopularProductController>().Get_Cart_Items <= 0
                    ? GestureDetector(
                      onTap: (){
                       Get.toNamed(Routes.got_to_cartHome(true));
                      },
                      child: AppIcon(
                          iconbackground: Icons.circle,
                          icontop: Icons.shopping_cart),
                    )
                    : GestureDetector(
                     onTap: (){
                       Get.toNamed(Routes.got_to_cartHome(false));
                     },
                      child: Stack(
                          children: [
                            AppIcon(
                                iconbackground: Icons.circle,
                                icontop: Icons.shopping_cart),
                            Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                child: Align(alignment: Alignment.bottomCenter,
                                  child: Icon(
                                    Icons.circle,
                                    size: dimentions.height20,
                                    color: Colors.blue,
                                  ),
                                )),
                            Positioned(left:0,right: 0,top: 0,child: Align(alignment: Alignment.bottomCenter,child: Text(popularproducts.Get_Cart_Items.toString())))
                          ],
                        ),
                    )),
            Positioned(
                left: 0,
                right: 0,
                top: 300,
                bottom: 0, // i was here
                child: Container(
                  width: double.maxFinite,
                  height: 600,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigFont(text: product.name),
                        SizedBox(
                          height: dimentions.height5,
                        ),
                        Row(
                          children: [
                            Wrap(
                                spacing: 3,
                                children: List.generate(
                                    product.stars,
                                    (index) => Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Colors.blue,
                                        ))),
                            SizedBox(
                              width: 10,
                            ),
                            SmallFont(text: product.stars.toString()),
                            SizedBox(
                              width: 10,
                            ),
                            SmallFont(text: "1287 comments")
                          ],
                        ),
                        SizedBox(
                          height: dimentions.height20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextIcons(
                                iconn: Icons.circle,
                                text: "Normal",
                                IconColor: Colors.yellow,
                                textColor: Colors.black),
                            TextIcons(
                                iconn: Icons.location_on,
                                text: "1.2",
                                IconColor: Colors.blue,
                                textColor: Colors.black),
                            TextIcons(
                                iconn: Icons.access_alarm_outlined,
                                text: "32 min",
                                IconColor: Colors.red,
                                textColor: Colors.black)
                          ],
                        ),
                        SizedBox(
                          height: dimentions.height20,
                        ),
                        BigFont(text: "Introduce"),
                        SizedBox(
                          height: dimentions.height20,
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                                child: ExpandedText(text: product.description)))
                      ],
                    ),
                  ),
                ))
          ],
        );
      },
    ), bottomNavigationBar: GetBuilder<PopularProductController>(
      builder: (poppularproducts) {
        return Container(
          height: 120,
          width: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                width: double.maxFinite,
                color: Colors.grey,
              )),
              Positioned(
                  left: 10,
                  right: 260,
                  bottom: 20,
                  child: Container(
                    height: 50,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(right: dimentions.width20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              poppularproducts.increment(false);
                            },
                            child: Icon(
                              Icons.remove,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          Text(
                            (poppularproducts.cartItem).toString(),
                            style: TextStyle(fontSize: 27),
                          ),
                          GestureDetector(
                            onTap: () {
                              poppularproducts.increment(true);
                            },
                            child: Icon(
                              Icons.add,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  right: 10,
                  left: 200,
                  bottom: 20,
                  child: GestureDetector(
                    onTap: () {
                      poppularproducts.add_cart(
                          product, poppularproducts.quantity);
                    },
                    child: Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(offset: Offset(0, 5))]),
                      child: Center(
                          child: Text(
                        "\$0.2",
                        style: TextStyle(fontSize: 25),
                      )),
                    ),
                  ))
            ],
          ),
        );
      },
    ));
  }
}
