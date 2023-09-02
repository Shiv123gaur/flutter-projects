import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/controllers/recommended_products_controller.dart';
import 'package:ecommerce/routes/routes_helper.dart';
import 'package:ecommerce/screens/food/popularFoodDetails.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimentions.dart';
import 'package:ecommerce/utils/project_constanst.dart';
import 'package:ecommerce/widgets/Big_text.dart';
import 'package:ecommerce/widgets/Small_text.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/text_icon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  PageController _pageController = PageController(viewportFraction: 0.85);
  var currentPage = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
        print(currentPage);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularproducts){
          return popularproducts.isloaded?Container(
            height: dimentions.containerHeight,
            child: PageView.builder(
                controller: _pageController,
                itemCount: popularproducts.popularProductList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(onTap:(){
                    Get.toNamed(Routes.go_to_popularFood(index,"food_page"));
                  },child: pageviewChild(index,popularproducts.popularProductList[index]));
                }),
          ):CircularProgressIndicator(color: Colors.blue,);
        }),
        GetBuilder<PopularProductController>(builder: (popularproducts){
           return new DotsIndicator(
             dotsCount: popularproducts.popularProductList.isEmpty?1:popularproducts.popularProductList.length,
             position: currentPage.ceil(),
             decorator: DotsDecorator(
                 activeShape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(5)),
                 size: Size.square(dimentions.height5),
                 activeColor: Colors.black,
                 activeSize: Size(dimentions.height20, dimentions.height5)),
           );
        }),
        SizedBox(
          height: dimentions.height30,
        ),
        Container(
          margin: EdgeInsets.only(
              left: dimentions.width10, right: dimentions.width10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigFont(text: "Recommended"),
              SizedBox(
                width: dimentions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: dimentions.height5),
                child: BigFont(
                  text: '.',
                ),
              ),
              SizedBox(
                width: dimentions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: dimentions.height5),
                child: SmallFont(
                  text: "Food Pairing",
                ),
              )
            ],
          ),
        ),
        GetBuilder<Recommended_products_Controller>(builder: (recommendProducts){
           return recommendProducts.products.isEmpty?CircularProgressIndicator(color: Colors.blue,):ListView.builder(
               shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
               itemCount: recommendProducts.products.length,
               itemBuilder: (context, index) {
                 return GestureDetector(
                   onTap: (){
                     Get.toNamed(Routes.go_to_recommendedFood(index,"food_page"));
                   },
                   child: Container(
                     margin: EdgeInsets.only(
                         left: dimentions.width20,
                         right: dimentions.width20,
                         bottom: dimentions.width5,
                         top: dimentions.height20 ),
                     child: Row(
                       children: [
                         Container(
                           height:dimentions.listViewImage,
                           width: dimentions.listViewImage,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(30),
                               color: Colors.red,
                               image: DecorationImage(
                                   fit: BoxFit.fill,
                                   image: NetworkImage(AppConstants.BASE_URL+"/uploads/"+recommendProducts.products[index].img!),
                               )
                           ),
                         ),
                         Expanded(
                           child: Container(
                             margin: EdgeInsets.only(right: dimentions.height5),
                             height: 120,
                             //width: 241.4,
                             decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(dimentions.radius20),bottomRight: Radius.circular(dimentions.radius20)),color: Colors.white60),
                             child: Padding(
                               padding: EdgeInsets.only(left: dimentions.width10,right: dimentions.width10),
                               child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   BigFont(text: recommendProducts.products[index].name!),
                                   SizedBox(height: dimentions.height5,),
                                   SmallFont(text: recommendProducts.products[index].description),
                                   SizedBox(height: dimentions.height5,),
                                   Row(
                                     children: [
                                       TextIcons(iconn: Icons.circle, text: "Normal", IconColor: Colors.yellow, textColor: Colors.black),
                                       TextIcons(iconn: Icons.location_on, text: "1.5", IconColor: Colors.red, textColor: Colors.black),
                                       TextIcons(iconn: Icons.timer, text: "1 hr", IconColor: Colors.blue, textColor: Colors.black),
                                     ],
                                   )

                                 ],),
                             ),
                           ),
                         )
                       ],
                     ),
                   ),
                 );
               });
        }),
      ],
    );
  }
}

Widget pageviewChild(int index, popularProduct,) {
  return Stack(
    children: [
     GetBuilder<PopularProductController>(builder: (popularproducts){
       return  Container(
         margin: EdgeInsets.only(
             left: dimentions.width10, right: dimentions.width10),
         height: dimentions.innerContainerHeight,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(dimentions.radius20),
           image: DecorationImage(
               image: NetworkImage(AppConstants.BASE_URL+"/uploads/"+popularProduct.img!),
               fit: BoxFit.fill),
         ),
       );
     }

     ),
      GetBuilder<PopularProductController>(builder: (popularProducts){
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(dimentions.width5),
            margin: EdgeInsets.only(
                top:dimentions.height160,
                left: dimentions.width30,
                right: dimentions.width30,
                bottom: dimentions.height30),
            height: dimentions.pageviewText,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    //spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 5)),
                BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                BoxShadow(color: Colors.white, offset: Offset(5, 0))
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(dimentions.height20),
            ),
            child: Padding(
              padding:  EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigFont(
                    text: popularProducts.popularProductList[index].name!,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: dimentions.height5,
                  ),
                  Column(
                    children: [
                      Wrap(
                        spacing: 3,
                        children: List.generate(
                                 popularProducts.popularProductList[index].stars!,
                                (index) => Icon(
                              Icons.star,
                              size: dimentions.star,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: dimentions.width10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextIcons(
                        iconn: Icons.circle,
                        text: "Normal",
                        textColor: Colors.black,
                        IconColor: Color(0xffFFAE42),
                      ),
                      SizedBox(
                        width: dimentions.width5,
                      ),
                      TextIcons(
                          iconn: Icons.location_on,
                          text: "1.5",
                          IconColor: Colors.red,
                          textColor: Colors.black),
                      SizedBox(
                        width: dimentions.width5,
                      ),
                      TextIcons(
                          iconn: Icons.timer,
                          text: "5 hr",
                          IconColor: Colors.blue,
                          textColor: Colors.black)
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      })
    ],
  );
}
