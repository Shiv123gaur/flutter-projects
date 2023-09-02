import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/controllers/recommended_products_controller.dart';
import 'package:ecommerce/helper/dependencies.dart';
import 'package:ecommerce/routes/routes_helper.dart';
import 'package:ecommerce/screens/Home/home_food_page.dart';
import 'package:ecommerce/utils/project_constanst.dart';
import 'package:ecommerce/widgets/Big_text.dart';
import 'package:ecommerce/widgets/Small_text.dart';
import 'package:ecommerce/widgets/appIcon.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/utils/dimentions.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/screens/Home/home_food_page.dart';

class Cart_Home extends StatelessWidget {
  const Cart_Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<CartController>(builder: (cartcontroller){
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(top: dimentions.width5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: AppIcon(
                          iconbackground: Icons.circle,
                          icontop: Icons.arrow_back_ios,
                          colorr: Colors.greenAccent,
                          size: dimentions.height50,
                        ),
                      ),
                      SizedBox(
                        width: dimentions.width10 * 7,
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(Routes.go_to_home());
                        },
                        child: AppIcon(
                          iconbackground: Icons.circle,
                          icontop: Icons.home_outlined,
                          colorr: Colors.greenAccent,
                          size: dimentions.height50,
                        ),
                      ),
                      AppIcon(
                        iconbackground: Icons.circle,
                        icontop: Icons.shopping_cart_outlined,
                        colorr: Colors.greenAccent,
                        size: dimentions.height50,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(flex: 10,
                child: Container(
                  child: ListView.builder(
                      itemCount: cartcontroller.cartItemss.length,
                      itemBuilder: (_, index) {
                        return Container(
                          decoration: BoxDecoration(color: Colors.white30,
                              borderRadius:
                              BorderRadius.circular(dimentions.radius10)),
                          height: dimentions.height110,
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  var indexx = Get.find<PopularProductController>().popularProductList.indexOf(cartcontroller.cartItemss[index].product!);
                                  print("This is the index shiv ${indexx}");
                                  if(indexx>=0){
                                    Get.toNamed(Routes.go_to_popularFood(indexx,"cart"));
                                  }else{
                                    var indexxx = Get.find<Recommended_products_Controller>().products.indexOf(cartcontroller.cartItemss[index].product!);
                                    Get.toNamed(Routes.go_to_recommendedFood(indexxx,"cart"));
                                  }
                                },
                                child: Container(
                                  height:dimentions.height110,
                                  width: dimentions.width150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(AppConstants.BASE_URL+ "/uploads/" +cartcontroller.cartItemss[index].img!)
                                    )
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: dimentions.width10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigFont(text: cartcontroller.cartItemss[index].name!,size: dimentions.height30*0.5,),
                                  SmallFont(text: "Spicy",size: dimentions.height10,),
                                  Row(
                                    children: [
                                      SmallFont(text: "\$ ${cartcontroller.cartItemss[index].price}"),
                                      SizedBox(
                                        width: dimentions.height50,
                                      ),
                                      Container(padding: EdgeInsets.all(dimentions.width5),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                dimentions.radius10),
                                            color:Colors.greenAccent),
                                        height: dimentions.height50,
                                        width: dimentions.height100,
                                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                                onTap: (){
                                                  cartcontroller.Add_to_Cart(cartcontroller.cartItemss[index].product!, -1);
                                                },
                                                child: Icon(Icons.remove,color: Colors.black,)),
                                            SmallFont(text:cartcontroller.cartItemss[index].quantity.toString()),
                                            GestureDetector(
                                                onTap: (){
                                                    cartcontroller.Add_to_Cart(cartcontroller.cartItemss[index].product!, 1);
                                                },
                                                child: Icon(Icons.add))
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
              Expanded(flex: 2,
                child: Container(
                  padding: EdgeInsets.all(dimentions.width20),
                  color: Colors.grey,
                  width: double.infinity,
                  // height: dimentions.height100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: dimentions.height50,
                        width: dimentions.width30 * 4,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.circular(dimentions.radius10)),
                        child: Center(
                            child: Text(
                              "${cartcontroller.totalAmount}\$",
                              style:
                              GoogleFonts.nunito(fontSize: dimentions.font20),
                            )),
                      ),
                      Container(
                        height: dimentions.height50,
                        width: dimentions.width30 * 4,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius:
                            BorderRadius.circular(dimentions.radius10)),
                        child: Center(
                            child: Text(
                              "Check Out",
                              style:
                              GoogleFonts.nunito(fontSize: dimentions.font10),
                            )),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        })
      ),
    );
  }
}


