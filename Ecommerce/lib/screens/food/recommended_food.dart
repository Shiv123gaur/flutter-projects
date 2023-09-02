import 'package:ecommerce/controllers/recommended_products_controller.dart';
import 'package:ecommerce/routes/routes_helper.dart';
import 'package:ecommerce/screens/cart/cart_home.dart';
import 'package:ecommerce/utils/dimentions.dart';
import 'package:ecommerce/utils/project_constanst.dart';
import 'package:ecommerce/widgets/Big_text.dart';
import 'package:ecommerce/widgets/ExpandableText.dart';
import 'package:ecommerce/widgets/Small_text.dart';
import 'package:ecommerce/widgets/appIcon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:get/get.dart';

class Recommended_Food extends StatelessWidget {
  const Recommended_Food({Key? key, required this.pageId,required this.page}) : super(key: key);
  final int pageId;
  final String page;

  @override
  Widget build(BuildContext context) {
    var product = Get.find<Recommended_products_Controller>().products[pageId];
    Get.find<PopularProductController>().initiate(Get.find(), product);
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if(page=="cart"){
                          Get.toNamed(Routes.got_to_cartHome());
                        }else{
                          Get.toNamed(Routes.go_to_home());
                        }
                      },
                      child: AppIcon(
                          iconbackground: Icons.circle, icontop: Icons.clear)),
                  GetBuilder<PopularProductController>(builder: (popularproducts){
                     return Positioned(
                         right: dimentions.width10,
                         top: 50,
                         child: Get.find<PopularProductController>().Get_Cart_Items <= 0
                             ? AppIcon(
                             iconbackground: Icons.circle,
                             icontop: Icons.shopping_cart)
                             : Stack(
                           children: [
                             GestureDetector(
                               onTap: (){
                                 Get.toNamed(Routes.got_to_cartHome());
                               },
                               child: AppIcon(
                                   iconbackground: Icons.circle,
                                   icontop: Icons.shopping_cart),
                             ),
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
                             Positioned(left:0,right: 0,top: 0,child: Align(alignment: Alignment.bottomCenter,child: Text(popularproducts.Get_Cart_Items.toString(),style: TextStyle(color: Colors.black,fontSize: 15),)))
                           ],
                         ));
                  })

                ],
              ),
              backgroundColor: Colors.white,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(10),
                child: Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Center(
                      child: Text(
                    product.name,
                    style: GoogleFonts.nunito(
                        color: Colors.black, fontSize: dimentions.font20),
                  )),
                  decoration: const BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15))),
                  width: double.maxFinite,
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.BASE_URL + "/uploads/" + product.img,
                  fit: BoxFit.cover,
                ),
              ),
              expandedHeight: 200,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(15),
                      child: ExpandedText(text: product.description)),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popularproducts) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        popularproducts.increment(false);
                      },
                      child: AppIcon(
                        iconbackground: Icons.circle,
                        icontop: Icons.remove,
                        colorr: Colors.greenAccent,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    BigFont(
                        text: "\$" +
                            "${product.price}" +
                            " X" +
                            " ${popularproducts.cartItem}"),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        popularproducts.increment(true);
                      },
                      child: AppIcon(
                        iconbackground: Icons.circle,
                        icontop: Icons.add,
                        colorr: Colors.greenAccent,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 100,
                  color: Colors.grey,
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        margin: EdgeInsets.only(
                            left: 20, top: 20, right: 50, bottom: 20),
                        height: 60,
                        width: 50,
                        child: Icon(
                          Icons.heart_broken,
                          color: Colors.greenAccent,
                        ),
                      ),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          popularproducts.add_cart(
                              product, popularproducts.quantity);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 20, right: 50, top: 20, bottom: 20),
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Center(
                              child: SmallFont(
                                  text: "\$" +
                                      "${product.price}" +
                                      " | ADD TO CART")),
                        ),
                      ))
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
